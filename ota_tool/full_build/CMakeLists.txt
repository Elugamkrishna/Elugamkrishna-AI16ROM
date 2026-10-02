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
include_directories("../deps/fec")
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
  "${ROOT}/deps/erofs-utils/include"
  "${ROOT}/deps/system_core/libutils/include"
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
  "${ROOT}/update_engine/payload_generator/fake_filesystem.cc"
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
  "${ROOT}/update_engine/payload_consumer/verity_writer_stub.cc"
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
  "${ROOT}/update_engine/common/constants.cc"
  "${ROOT}/update_engine/common/cow_operation_convert.cc"
  "${ROOT}/update_engine/common/hwid_override.cc"
  "${ROOT}/update_engine/common/http_fetcher.cc"

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
  "${ROOT}/deps/libchrome/base/location.cc"
  "${ROOT}/deps/libchrome/base/command_line.cc"
  "${ROOT}/deps/libchrome/base/callback_internal.cc"
  "${ROOT}/deps/libchrome/base/rand_util.cc"
  "${ROOT}/deps/libchrome/base/files/file_path.cc"
  "${ROOT}/deps/libchrome/base/files/file_enumerator.cc"
  "${ROOT}/deps/libchrome/base/files/scoped_temp_dir.cc"
  "${ROOT}/deps/libchrome/base/files/file_util.cc"
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

set(GENERATED_PROTO
)

add_executable(delta_generator
  ${DELTA_SOURCES}
  ${GENERATED_PROTO}
)

target_compile_definitions(delta_generator PRIVATE
  AVB_COMPILATION=1
  HAVE_MEMRCHR=1
  PACKAGE_VERSION="1.8"
  __ANDROID_UNAVAILABLE_SYMBOLS_ARE_WEAK__
)

target_link_libraries(delta_generator PRIVATE
  ${ROOT}/deps/gflags_install/lib/libgflags.a
  protobuf::libprotobuf
  OpenSSL::Crypto
  lz4
  zstd
  bz2
  z
  lzma
  pthread
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

include_directories("${CMAKE_SOURCE_DIR}/../deps/external_avb/libavb/boringssl") # AI14ROM_AVB_CRYPTO_HEADER_DIR
