cmake_minimum_required(VERSION 3.10)
project(delta_generator C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -w -fPIC")
set(CMAKE_OBJECT_PATH_MAX 200)

find_package(Protobuf REQUIRED)
find_package(OpenSSL REQUIRED)

set(ROOT "${CMAKE_CURRENT_SOURCE_DIR}/..")
set(GEN "${CMAKE_CURRENT_SOURCE_DIR}/gen")

include_directories(
  "${ROOT}/deps/fec"
  "${ROOT}"
  "${ROOT}/update_engine"
  "${GEN}"
  "${ROOT}/local_glog"
  "${ROOT}/deps/libbase"
  "${ROOT}/deps/libbase/include"
  "${ROOT}/deps/libchrome"
  "${ROOT}/deps/libbrillo"
  "${ROOT}/deps/external_avb"
  "${ROOT}/deps/external_avb/libavb"
  "${ROOT}/deps/gflags_install/include"
  "${ROOT}/deps/googletest/googletest/include"
  "${ROOT}/deps/puffin"
  "${ROOT}/deps/puffin/src"
  "${ROOT}/deps/puffin/src/include"
  "${ROOT}/deps/bsdiff"
  "${ROOT}/deps/bsdiff/include"
  "${ROOT}/deps/zucchini"
  "${ROOT}/deps/zucchini/include"
  "${ROOT}/deps/zucchini/aosp/include"
  "${ROOT}/deps/zucchini/aosp/include/components"
  "${ROOT}/deps/lzma/C"
  "${CMAKE_CURRENT_SOURCE_DIR}/gen"
  "${ROOT}/deps/erofs-utils/include"
  "${ROOT}/deps/system_core/libutils/include"
  "${ROOT}/deps/system_logging/liblog/include"
  "${ROOT}/deps/system_core/libcutils/include"
  "${ROOT}/deps/system_core/fs_mgr/libsnapshot/include"
  "${ROOT}/deps/system_core/libcrypto_utils/include"
  "${ROOT}/deps/system_extras/libfec/include"
  "${ROOT}/deps/system_extras/verity/include"
  "${ROOT}/deps/system_extras/ext4_utils/include"
  "${ROOT}/deps/system_extras/squashfs_utils"
)

set(DELTA_SOURCES

  # Update Engine generator core
  "${ROOT}/update_engine/payload_generator/generate_delta_main.cc"
  "${ROOT}/update_engine/payload_generator/ab_generator.cc"
  "${ROOT}/update_engine/payload_generator/annotated_operation.cc"
  "${ROOT}/update_engine/payload_generator/blob_file_writer.cc"
  "${ROOT}/update_engine/payload_generator/block_mapping.cc"
  "${ROOT}/update_engine/payload_generator/boot_img_filesystem.cc"
  "${ROOT}/update_engine/payload_generator/bzip.cc"
  "${ROOT}/update_engine/payload_generator/cow_size_estimator_stub.cc"
  "${ROOT}/update_engine/payload_generator/deflate_utils.cc"
  "${ROOT}/update_engine/payload_generator/delta_diff_generator.cc"
  "${ROOT}/update_engine/payload_generator/delta_diff_utils.cc"
  "${ROOT}/update_engine/payload_generator/erofs_filesystem.cc"
  "${ROOT}/update_engine/payload_generator/ext2_filesystem.cc"
  "${ROOT}/update_engine/payload_generator/extent_ranges.cc"
  "${ROOT}/update_engine/payload_generator/extent_utils.cc"
  ""
  "${ROOT}/update_engine/payload_generator/full_update_generator.cc"
  "${ROOT}/update_engine/payload_generator/mapfile_filesystem.cc"
  "${ROOT}/update_engine/payload_generator/merge_sequence_generator.cc"
  "${ROOT}/update_engine/payload_generator/payload_file.cc"
  "${ROOT}/update_engine/payload_generator/payload_generation_config.cc"
  "${ROOT}/update_engine/payload_generator/payload_generation_config_android.cc"
  "${ROOT}/update_engine/payload_generator/payload_properties.cc"
  "${ROOT}/update_engine/payload_generator/payload_signer.cc"
  "${ROOT}/update_engine/payload_generator/raw_filesystem.cc"
  "${ROOT}/update_engine/payload_generator/squashfs_filesystem.cc"
  "${ROOT}/update_engine/payload_generator/xz_android.cc"

  # Payload consumer / metadata dependencies already verified
  "${ROOT}/update_engine/payload_consumer/file_descriptor.cc"
  "${ROOT}/update_engine/payload_consumer/file_descriptor_utils.cc"
  "${ROOT}/update_engine/payload_consumer/file_writer.cc"
  "${ROOT}/update_engine/payload_consumer/payload_constants.cc"
  "${ROOT}/update_engine/payload_consumer/payload_metadata.cc"
  "${ROOT}/update_engine/payload_consumer/payload_verifier.cc"
  "${ROOT}/update_engine/payload_consumer/filesystem_verifier_action.cc"

  "${ROOT}/update_engine/payload_consumer/vabc_partition_writer.cc"
  "${ROOT}/update_engine/payload_consumer/install_operation_executor.cc"
  "${ROOT}/update_engine/payload_consumer/partition_writer.cc"
  "${ROOT}/update_engine/payload_consumer/partition_writer_factory_android.cc"
  "${ROOT}/update_engine/payload_consumer/partition_update_generator_stub.cc"
  "${ROOT}/update_engine/payload_consumer/delta_performer.cc"
  "${ROOT}/update_engine/payload_consumer/extent_reader.cc"
  "${ROOT}/update_engine/payload_consumer/extent_writer.cc"
  "${ROOT}/update_engine/payload_consumer/block_extent_writer.cc"
  "${ROOT}/update_engine/payload_consumer/bzip_extent_writer.cc"
  "${ROOT}/update_engine/payload_consumer/cached_file_descriptor.cc"
  "${ROOT}/update_engine/payload_consumer/fec_file_descriptor.cc"
  "${ROOT}/update_engine/payload_consumer/mount_history.cc"
  "${ROOT}/update_engine/payload_consumer/postinstall_runner_action.cc"
  "${ROOT}/update_engine/payload_consumer/snapshot_extent_writer.cc"
  "${ROOT}/update_engine/payload_consumer/xor_extent_writer.cc"
  "${ROOT}/update_engine/payload_consumer/xz_extent_writer.cc"
  "${ROOT}/update_engine/payload_consumer/verified_source_fd.cc"

  # Update Engine common
  # Stage 6 verified Update Engine common implementations
  "${ROOT}/update_engine/common/terminator.cc"
  "${ROOT}/update_engine/common/utils.cc"
  "${ROOT}/update_engine/common/prefs.cc"
  "${ROOT}/update_engine/common/hash_calculator.cc"
  "${ROOT}/update_engine/common/file_fetcher.cc"
  "${ROOT}/update_engine/common/action_processor.cc"

  # Stage 6 verified generated protobuf implementation
  "${CMAKE_CURRENT_SOURCE_DIR}/gen/update_engine/update_metadata.pb.cc"
  "${CMAKE_CURRENT_SOURCE_DIR}/gen/lz4diff/lz4diff.pb.cc"

  "${ROOT}/update_engine/common/constants.cc"
  "${ROOT}/update_engine/common/cow_operation_convert.cc"
  "${ROOT}/update_engine/common/hwid_override.cc"
  "${ROOT}/update_engine/common/http_fetcher.cc"

  "${ROOT}/update_engine/common/dynamic_partition_control_stub.cc"
  "${ROOT}/update_engine/aosp/platform_constants_android.cc"
  # Required top-level Update Engine pieces
  "${ROOT}/update_engine/download_action.cc"
  "${ROOT}/update_engine/payload_consumer/install_plan.cc"

  # lz4diff
  "${ROOT}/update_engine/lz4diff/lz4diff.cc"
  "${ROOT}/update_engine/lz4diff/lz4patch.cc"

  # libbase sources already required by previous link fixes
  "${ROOT}/deps/libbase/logging.cpp"
  "${ROOT}/deps/libbase/strings.cpp"
  "${ROOT}/deps/libbase/posix_strerror_r.cpp"

  # libchrome required implementations
  "${ROOT}/deps/libchrome/base/md5.cc"
  "${ROOT}/deps/libchrome/base/synchronization/lock_impl_posix.cc"
  "${ROOT}/deps/libchrome/base/location.cc"
  "${ROOT}/deps/libchrome/base/command_line.cc"
  "${ROOT}/deps/libchrome/base/callback_internal.cc"
  "${ROOT}/deps/libchrome/base/rand_util.cc"
  "${ROOT}/deps/libchrome/base/files/file_path.cc"
  "${ROOT}/deps/libchrome/base/files/file_enumerator.cc"
  "${ROOT}/deps/libchrome/base/files/scoped_temp_dir.cc"
  "${ROOT}/deps/libchrome/base/files/file_util.cc"
  "${ROOT}/deps/libchrome/base/files/file_util_posix.cc"
  "${ROOT}/deps/libchrome/base/strings/string_util.cc"
  "${ROOT}/deps/libchrome/base/strings/string_number_conversions.cc"
  "${ROOT}/deps/libchrome/base/strings/stringprintf.cc"
  "${ROOT}/deps/libchrome/base/strings/string_split.cc"
  "${ROOT}/deps/libchrome/base/strings/string_piece.cc"
  "${ROOT}/deps/libchrome/base/strings/utf_string_conversions.cc"
  "${ROOT}/deps/libchrome/base/strings/utf_string_conversion_utils.cc"
  "${ROOT}/deps/libchrome/base/strings/string16.cc"
  "${ROOT}/deps/libchrome/base/values.cc"
  "${ROOT}/deps/libchrome/base/json/json_writer.cc"
  "${ROOT}/deps/libchrome/base/time/time.cc"
  "${ROOT}/deps/libchrome/base/time/time_now_posix.cc"
  "${ROOT}/deps/libchrome/base/time/time_conversion_posix.cc"
  "${ROOT}/deps/libchrome/base/time/time_exploded_posix.cc"
  "${ROOT}/deps/libchrome/base/threading/simple_thread.cc"
  "${ROOT}/deps/libchrome/base/threading/platform_thread_posix.cc"
  "${ROOT}/deps/libchrome/base/threading/platform_thread_internal_posix.cc"
  "${ROOT}/deps/libchrome/base/threading/platform_thread_linux.cc"
  "${ROOT}/deps/libchrome/base/threading/thread_local_storage.cc"
  "${ROOT}/deps/libchrome/base/threading/thread_local_storage_posix.cc"
  "${ROOT}/deps/libchrome/base/threading/thread_id_name_manager.cc"
  "${ROOT}/deps/libchrome/base/posix/safe_strerror.cc"
  "${ROOT}/deps/libchrome/base/third_party/nspr/prtime.cc"
  "${ROOT}/deps/libchrome/base/debug/stack_trace.cc"
  "${ROOT}/deps/libchrome/base/debug/stack_trace_posix.cc"
  "${ROOT}/deps/libchrome/base/debug/activity_tracker.cc"
  "${ROOT}/deps/libchrome/base/pickle.cc"
  "${ROOT}/deps/libchrome/base/metrics/persistent_memory_allocator.cc"
  "${ROOT}/deps/libchrome/base/metrics/histogram.cc"
  "${ROOT}/deps/libchrome/base/metrics/histogram_base.cc"

  # libbrillo required implementations
  "${ROOT}/deps/libbrillo/brillo/file_utils.cc"
  "${ROOT}/deps/libbrillo/brillo/key_value_store.cc"
  "${ROOT}/deps/libbrillo/brillo/process.cc"
  "${ROOT}/deps/libbrillo/brillo/process_reaper.cc"
  "${ROOT}/deps/libbrillo/brillo/strings/string_utils.cc"
  "${ROOT}/deps/libbrillo/brillo/streams/stream.cc"
  "${ROOT}/deps/libbrillo/brillo/streams/file_stream.cc"
  "${ROOT}/deps/libbrillo/brillo/message_loops/message_loop.cc"
  "${ROOT}/deps/libbrillo/brillo/message_loops/base_message_loop.cc"

  # BSDIFF
  "${ROOT}/deps/bsdiff/bsdiff.cc"
  "${ROOT}/deps/bsdiff/patch_writer_factory.cc"
  "${ROOT}/deps/bsdiff/patch_reader.cc"

  # Puffin
  "${ROOT}/deps/puffin/src/puffdiff.cc"
  "${ROOT}/deps/puffin/puffin/src/brotli_util.cc"
  "${ROOT}/deps/puffin/puffin/src/utils.cc"

  # Zucchini
  "${ROOT}/deps/zucchini/patch_writer.cc"
  "${ROOT}/deps/zucchini/zucchini_gen.cc"
  "${ROOT}/deps/zucchini/buffer_sink.cc"

  # EROFS
  "${ROOT}/deps/erofs-utils/lib/namei.c"
  "${ROOT}/deps/erofs-utils/lib/config.c"

  # AVB
  "${ROOT}/deps/external_avb/libavb/avb_descriptor.c"
  "${ROOT}/deps/external_avb/libavb/avb_footer.c"
  "${ROOT}/deps/external_avb/libavb/avb_hash_descriptor.c"
  "${ROOT}/deps/external_avb/libavb/avb_hashtree_descriptor.c"
  "${ROOT}/deps/external_avb/libavb/avb_kernel_cmdline_descriptor.c"
  "${ROOT}/deps/external_avb/libavb/avb_property_descriptor.c"
  "${ROOT}/deps/external_avb/libavb/avb_rsa.c"
  "${ROOT}/deps/external_avb/libavb/avb_slot_verify.c"
  "${ROOT}/deps/external_avb/libavb/avb_sysdeps_posix.c"
  "${ROOT}/deps/external_avb/libavb/avb_util.c"
  "${ROOT}/deps/external_avb/libavb/avb_vbmeta_image.c"
  "${ROOT}/deps/external_avb/libavb/avb_version.c"
)


# ============================================================
# AI14ROM STAGE-6 FINAL LINK DEPENDENCY COMPLETION
# ============================================================

# Zucchini core implementation.
file(GLOB AI14ROM_ZUCCHINI_SOURCES
  "${ROOT}/deps/zucchini/*.cc"
)
list(FILTER AI14ROM_ZUCCHINI_SOURCES
  EXCLUDE REGEX ".*_unittest\\.cc$"
)

# ============================================================
# AI14ROM: delta_generator already has generate_delta_main.cc.
# Zucchini standalone CLI main files must NOT be compiled here.
# This also avoids Android/AOSP LoggingSettings incompatibility.
# ============================================================
list(FILTER AI14ROM_ZUCCHINI_SOURCES
  EXCLUDE REGEX ".*/zucchini_main(_aosp)?\\.cc$"
)
list(FILTER AI14ROM_ZUCCHINI_SOURCES
  EXCLUDE REGEX ".*/integration_test\\.cc$"
)
list(FILTER AI14ROM_ZUCCHINI_SOURCES
  EXCLUDE REGEX ".*/test_disassembler\\.cc$"
)
list(FILTER AI14ROM_ZUCCHINI_SOURCES
  EXCLUDE REGEX ".*/test_reference_reader\\.cc$"
)
list(FILTER AI14ROM_ZUCCHINI_SOURCES
  EXCLUDE REGEX ".*/test_utils\\.cc$"
)
list(FILTER AI14ROM_ZUCCHINI_SOURCES
  EXCLUDE REGEX ".*/test_.*\\.cc$"
)

foreach(src ${AI14ROM_ZUCCHINI_SOURCES})
  list(APPEND DELTA_SOURCES "${src}")
endforeach()

# Zucchini uses libchrome logging implementation.
list(APPEND DELTA_SOURCES
  "${ROOT}/deps/libchrome/base/logging.cc"
)

# EROFS runtime implementation required by erofs_filesystem.cc.
list(APPEND DELTA_SOURCES
  "${ROOT}/deps/erofs-utils/lib/io.c"
  "${ROOT}/deps/erofs-utils/lib/data.c"
  "${ROOT}/deps/erofs-utils/lib/zmap.c"
  "${ROOT}/deps/erofs-utils/lib/dir.c"
  "${ROOT}/deps/erofs-utils/lib/super.c"
)

# AVB complete core implementation.
file(GLOB AI14ROM_AVB_SOURCES
  "${ROOT}/deps/external_avb/libavb/*.c"
)

foreach(src ${AI14ROM_AVB_SOURCES})
  list(APPEND DELTA_SOURCES "${src}")
endforeach()

# Android AVB BoringSSL SHA implementation.
list(APPEND DELTA_SOURCES
  "${ROOT}/deps/external_avb/libavb/boringssl/sha.c"
)

# Protobuf static build requires its matching Abseil static libraries.
file(GLOB AI14ROM_ABSL_LIBS
  "${ROOT}/deps/protobuf_install/lib/libabsl_*.a"
)

list(SORT AI14ROM_ABSL_LIBS)

message(STATUS "AI14ROM ZUCCHINI SOURCES:")
foreach(src ${AI14ROM_ZUCCHINI_SOURCES})
  message(STATUS "  ${src}")
endforeach()

message(STATUS "AI14ROM AVB SOURCES:")
foreach(src ${AI14ROM_AVB_SOURCES})
  message(STATUS "  ${src}")
endforeach()

message(STATUS "AI14ROM ABSL LIBRARIES:")
foreach(lib ${AI14ROM_ABSL_LIBS})
  message(STATUS "  ${lib}")
endforeach()

set(GENERATED_PROTO
)


# AI14ROM Stage 6 — libziparchive
set(AI14ROM_ZIPARCHIVE_SOURCES
  "${ROOT}/deps/libziparchive/zip_archive.cc"
  "${ROOT}/deps/libziparchive/zip_archive_stream_entry.cc"
  "${ROOT}/deps/libziparchive/zip_cd_entry_map.cc"
  "${ROOT}/deps/libziparchive/zip_error.cpp"
  "${ROOT}/deps/libziparchive/zip_writer.cc"
)

set(AI14ROM_FEC_VERITY_SOURCES
  "${ROOT}/deps/system_extras/libfec/fec_open.cpp"
  "${ROOT}/deps/system_extras/verity/hash_tree_builder.cpp"
  "${ROOT}/update_engine/payload_consumer/verity_writer_android.cc"
  "${ROOT}/deps/libbrillo/brillo/data_encoding.cc"
  "${ROOT}/update_engine/common/subprocess.cc"
  "${ROOT}/deps/lzma/C/7zCrc.c"
  "${ROOT}/deps/lzma/C/Lzma2Enc.c"
  "${ROOT}/deps/lzma/C/XzEnc.c"
)

include_directories(
  "${ROOT}/deps/libziparchive/include"
  "${ROOT}/deps/libziparchive"
  "${ROOT}/deps/libziparchive/incfs_support/include"
)

add_executable(delta_generator
  ${DELTA_SOURCES}
  ${GENERATED_PROTO}
)

target_include_directories(delta_generator PRIVATE
  "${ROOT}/deps/modp_b64"
  "${ROOT}/deps/modp_b64/modp_b64"
)


target_compile_definitions(delta_generator PRIVATE
  __ANDROID_HOST__
  HAVE_CONFIG_H
  AVB_COMPILATION=1
  HAVE_MEMRCHR=1
  PACKAGE_VERSION="1.8"
  __ANDROID_UNAVAILABLE_SYMBOLS_ARE_WEAK__
)

target_sources(delta_generator PRIVATE ${AI14ROM_FEC_VERITY_SOURCES})
target_sources(delta_generator PRIVATE ${AI14ROM_ZIPARCHIVE_SOURCES})


add_compile_definitions(EVP_PKEY_size=EVP_PKEY_get_size EVP_PKEY_id=EVP_PKEY_get_id)

set(AI14ROM_STAGE6_LINK_SOURCES
  "${ROOT}/deps/libchrome/base/timer/timer.cc"
  "${ROOT}/deps/libchrome/base/message_loop/message_loop.cc"
  "${ROOT}/deps/libchrome/base/run_loop.cc"
  "${ROOT}/deps/libchrome/base/threading/thread_task_runner_handle.cc"
  "${ROOT}/deps/libchrome/base/threading/sequenced_task_runner_handle.cc"
  "${ROOT}/deps/libchrome/base/threading/post_task_and_reply_impl.cc"
  "${ROOT}/deps/libchrome/base/synchronization/condition_variable_posix.cc"
  "${ROOT}/deps/libchrome/base/feature_list.cc"
  "${ROOT}/deps/libchrome/base/metrics/field_trial_params.cc"
  "${ROOT}/deps/libchrome/base/build_time.cc"
  "${ROOT}/deps/libchrome/base/unguessable_token.cc"
  "${ROOT}/deps/libchrome/base/at_exit.cc"
  "${ROOT}/deps/libchrome/base/task_runner.cc"
  "${ROOT}/deps/libchrome/base/process/process_posix.cc"
  "${ROOT}/deps/libchrome/base/sys_info_posix.cc"
  "${ROOT}/deps/libchrome/base/metrics/bucket_ranges.cc"
  "${ROOT}/deps/libchrome/base/metrics/dummy_histogram.cc"
  "${ROOT}/deps/libchrome/base/metrics/histogram_functions.cc"
  "${ROOT}/deps/libchrome/base/metrics/histogram_samples.cc"
  "${ROOT}/deps/libchrome/base/metrics/metrics_hashes.cc"
  "${ROOT}/deps/libchrome/base/metrics/persistent_histogram_allocator.cc"
  "${ROOT}/deps/libchrome/base/metrics/persistent_histogram_storage.cc"
  "${ROOT}/deps/libchrome/base/metrics/persistent_sample_map.cc"
  "${ROOT}/deps/libchrome/base/metrics/sample_map.cc"
  "${ROOT}/deps/libchrome/base/metrics/sample_vector.cc"
  "${ROOT}/deps/libchrome/base/metrics/sparse_histogram.cc"
  "${ROOT}/deps/libchrome/base/metrics/field_trial.cc"
  "${ROOT}/deps/libchrome/base/files/scoped_file.cc"
  "${ROOT}/deps/libchrome/base/strings/string_util_constants.cc"
  "${ROOT}/deps/libchrome/base/value_iterators.cc"
  "${ROOT}/deps/libchrome/base/json/string_escape.cc"
  "${ROOT}/deps/libchrome/base/synchronization/waitable_event_posix.cc"
  "${ROOT}/deps/libchrome/base/debug/debugger_posix.cc"
  "${ROOT}/deps/libchrome/base/process/process_handle_posix.cc"
  "${ROOT}/deps/libchrome/base/memory/shared_memory_posix.cc"
  "${ROOT}/deps/libchrome/base/memory/ref_counted.cc"
  "${ROOT}/deps/libchrome/base/rand_util_posix.cc"
  "${ROOT}/deps/libchrome/base/files/file_path_constants.cc"
  "${ROOT}/deps/libchrome/base/lazy_instance_helpers.cc"
  "${ROOT}/deps/libchrome/base/strings/sys_string_conversions_posix.cc"
  "${ROOT}/deps/libchrome/base/third_party/icu/icu_utf.cc"
  "${ROOT}/update_engine/payload_consumer/certificate_parser_android.cc"
  "${ROOT}/deps/libbrillo/brillo/secure_blob.cc"
  "${ROOT}/deps/libbase/properties.cpp"
  "${ROOT}/update_engine/common/error_code_utils.cc"
  "${ROOT}/deps/libchrome/base/files/file.cc"
  "${ROOT}/deps/libchrome/base/files/file_posix.cc"
  "${ROOT}/deps/libchrome/base/files/memory_mapped_file.cc"
  "${ROOT}/deps/libchrome/base/files/memory_mapped_file_posix.cc"
  "${ROOT}/deps/bsdiff/bspatch.cc"
  "${ROOT}/deps/puffin/src/puffpatch.cc"
  "${ROOT}/deps/puffin/src/puffin_stream.cc"
  "${ROOT}/deps/puffin/src/extent_stream.cc"
  "${ROOT}/deps/puffin/src/memory_stream.cc"
  "${ROOT}/deps/puffin/src/file_stream.cc"
  "${ROOT}/deps/puffin/src/puff_reader.cc"
  "${ROOT}/deps/puffin/src/puff_writer.cc"
  "${ROOT}/deps/puffin/src/puffer.cc"
  "${ROOT}/deps/puffin/src/huffer.cc"
  "${ROOT}/deps/puffin/src/huffman_table.cc"
  "${ROOT}/deps/puffin/src/bit_reader.cc"
  "${ROOT}/deps/puffin/src/bit_writer.cc"
  "${ROOT}/deps/system_core/fs_mgr/libsnapshot/libsnapshot_cow/cow_writer.cpp"

  # ===== AI14ROM Stage 6.5 — verified linker owners =====
  "${ROOT}/deps/system_extras/libfec/fec_read.cpp"

  "${ROOT}/deps/libchrome/base/files/file_descriptor_watcher_posix.cc"
  "${ROOT}/deps/libchrome/base/files/file_enumerator_posix.cc"
  "${ROOT}/deps/libchrome/base/metrics/statistics_recorder.cc"

  "${ROOT}/deps/libbase/mapped_file.cpp"
  "${ROOT}/deps/libbase/stringprintf.cpp"
  "${ROOT}/deps/libbase/threads.cpp"

  "${ROOT}/update_engine/lz4diff/lz4diff_compress.cc"
  "${ROOT}/update_engine/common/multi_range_http_fetcher.cc"

  "${ROOT}/deps/bsdiff/patch_writer.cc"

  # liblog implementation required by libbase/logging.cpp
  "${ROOT}/deps/system_logging/liblog/logger_write.cpp"

  "${ROOT}/deps/libchrome/base/json/json_string_value_serializer.cc"
  "${ROOT}/deps/libchrome/base/files/important_file_writer.cc"
  "${ROOT}/deps/libchrome/base/process/process_handle.cc"
  "${ROOT}/deps/libchrome/base/process/process_metrics_posix.cc"
  "${ROOT}/deps/libchrome/base/posix/file_descriptor_shuffle.cc"
  "${ROOT}/deps/libchrome/base/memory/weak_ptr.cc"
  "${ROOT}/deps/libbrillo/brillo/errors/error.cc"
  "${ROOT}/deps/libbrillo/brillo/streams/stream_errors.cc"
  "${ROOT}/deps/libbrillo/brillo/streams/stream_utils.cc"
  ${ROOT}/deps/modp_b64/modp_b64.cc)

# AI14ROM Stage 6 host build: libchrome must not use Android JNI ContentUri paths.
target_compile_definitions(delta_generator PRIVATE AI14ROM_HOST_BUILD=1)

target_sources(delta_generator PRIVATE ${AI14ROM_STAGE6_LINK_SOURCES})

# ============================================================
# AI14ROM Stage 6.6 — COMPLETE HOST LINK DEPENDENCY CLOSURE
# ============================================================

# Host Brotli libraries required by Android bsdiff/puffin.
find_library(BROTLI_ENC_LIB brotlienc REQUIRED)
find_library(BROTLI_DEC_LIB brotlidec REQUIRED)

# Android external/fec Reed-Solomon implementation.
# Android libfec_rs is defined from these three source files.
# Build them directly for the Ubuntu host instead of searching for
# a system libfec_rs library, which is not provided by the runner.
set(AI14ROM_FEC_RS_SOURCES
  "${ROOT}/deps/external_fec/encode_rs_char.c"
  "${ROOT}/deps/external_fec/decode_rs_char.c"
  "${ROOT}/deps/external_fec/init_rs_char.c"
)

target_sources(delta_generator PRIVATE ${AI14ROM_FEC_RS_SOURCES})

# Protobuf + Abseil + generated utf8_range are mutually dependent
# static archives, therefore link them as one archive group.
target_link_libraries(delta_generator PRIVATE
  "-Wl,--start-group"

  ${ROOT}/deps/gflags_install/lib/libgflags.a

  protobuf::libprotobuf
  ${AI14ROM_ABSL_LIBS}

  ${BROTLI_ENC_LIB}
  ${BROTLI_DEC_LIB}

  OpenSSL::Crypto
  lz4
  zstd
  bz2
  z
  lzma
  ext2fs

  pthread

  # Protobuf utf8_range static runtime.
  ${ROOT}/deps/protobuf_install/lib/libutf8_range.a

  "-Wl,--end-group"
)

message(STATUS "========================================")
message(STATUS "AI14ROM TARGETED DELTA GENERATOR")
message(STATUS "EXPLICIT_SOURCE_COUNT=${DELTA_SOURCES}")
list(LENGTH DELTA_SOURCES AI14ROM_SOURCE_COUNT)
message(STATUS "AI14ROM_SOURCE_COUNT=${AI14ROM_SOURCE_COUNT}")
message(STATUS "========================================")

# Host-build compatibility: Android libchrome itoa_r
include_directories("${CMAKE_SOURCE_DIR}/../shim") # local_itoa_shim

# EROFS host-build config header
include_directories(
  "${CMAKE_SOURCE_DIR}/../deps/erofs-utils"
  "${CMAKE_SOURCE_DIR}/../deps/erofs-utils/include"
  "${CMAKE_BINARY_DIR}/erofs_config_include"
) # erofs_config_include

# erofs_existing_config removed for host build

include_directories(
  "${CMAKE_SOURCE_DIR}/../deps/erofs-utils/include"
) # erofs_config_persistent

include_directories("${CMAKE_SOURCE_DIR}/../deps/external_avb/libavb/boringssl")
include_directories("${CMAKE_SOURCE_DIR}/../deps/external_boringssl/src/include") # AI14ROM_AVB_CRYPTO_HEADER_DIR
