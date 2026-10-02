#pragma once

#include <lzma.h>
#include <cstddef>
#include <cstdint>

enum xz_mode {
  XZ_SINGLE = 0,
  XZ_PREALLOC = 1,
  XZ_DYNALLOC = 2,
};

enum xz_ret {
  XZ_OK = 0,
  XZ_STREAM_END = 1,
  XZ_UNSUPPORTED_CHECK = 2,
  XZ_MEM_ERROR = 3,
  XZ_MEMLIMIT_ERROR = 4,
  XZ_FORMAT_ERROR = 5,
  XZ_OPTIONS_ERROR = 6,
  XZ_DATA_ERROR = 7,
  XZ_BUF_ERROR = 8,
};

struct xz_buf {
  const uint8_t* in;
  size_t in_pos;
  size_t in_size;
  uint8_t* out;
  size_t out_pos;
  size_t out_size;
};

struct xz_dec {
  lzma_stream stream = LZMA_STREAM_INIT;
};

inline xz_dec* xz_dec_init(xz_mode, uint64_t dict_max) {
  xz_dec* dec = new xz_dec();

  uint64_t memlimit = dict_max;
  if (memlimit < (64ULL << 20))
    memlimit = (64ULL << 20);

  lzma_ret ret = lzma_stream_decoder(
      &dec->stream,
      memlimit,
      LZMA_TELL_UNSUPPORTED_CHECK);

  if (ret != LZMA_OK) {
    delete dec;
    return nullptr;
  }

  return dec;
}

inline void xz_dec_end(xz_dec* dec) {
  if (dec) {
    lzma_end(&dec->stream);
    delete dec;
  }
}

inline xz_ret xz_dec_run(xz_dec* dec, xz_buf* buf) {
  if (!dec || !buf)
    return XZ_DATA_ERROR;

  dec->stream.next_in =
      reinterpret_cast<const uint8_t*>(buf->in) + buf->in_pos;
  dec->stream.avail_in = buf->in_size - buf->in_pos;

  dec->stream.next_out =
      reinterpret_cast<uint8_t*>(buf->out) + buf->out_pos;
  dec->stream.avail_out = buf->out_size - buf->out_pos;

  lzma_ret ret = lzma_code(&dec->stream, LZMA_RUN);

  buf->in_pos =
      buf->in_size - dec->stream.avail_in;

  buf->out_pos =
      buf->out_size - dec->stream.avail_out;

  switch (ret) {
    case LZMA_OK:
      return XZ_OK;
    case LZMA_STREAM_END:
      return XZ_STREAM_END;
    case LZMA_UNSUPPORTED_CHECK:
      return XZ_UNSUPPORTED_CHECK;
    case LZMA_MEM_ERROR:
      return XZ_MEM_ERROR;
    case LZMA_MEMLIMIT_ERROR:
      return XZ_MEMLIMIT_ERROR;
    case LZMA_FORMAT_ERROR:
      return XZ_FORMAT_ERROR;
    case LZMA_OPTIONS_ERROR:
      return XZ_OPTIONS_ERROR;
    case LZMA_DATA_ERROR:
      return XZ_DATA_ERROR;
    case LZMA_BUF_ERROR:
      return XZ_BUF_ERROR;
    default:
      return XZ_DATA_ERROR;
  }
}

inline uint32_t xz_crc32(const uint8_t* buf,
                         size_t size,
                         uint32_t crc = 0) {
  return lzma_crc32(buf, size, crc);
}

inline void xz_crc32_init() {}
