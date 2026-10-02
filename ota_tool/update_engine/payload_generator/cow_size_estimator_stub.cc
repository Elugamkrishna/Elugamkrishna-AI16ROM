#include "update_engine/payload_generator/cow_size_estimator.h"

#include <cstdint>
#include <memory>
#include <string>

namespace chromeos_update_engine {

uint64_t EstimateCowSize(
    std::shared_ptr<FileDescriptor>,
    std::shared_ptr<FileDescriptor>,
    const google::protobuf::RepeatedPtrField<InstallOperation>&,
    const google::protobuf::RepeatedPtrField<CowMergeOperation>&,
    uint64_t,
    std::string,
    uint64_t,
    bool) {
  return 0;
}

bool CowDryRun(
    std::shared_ptr<FileDescriptor>,
    std::shared_ptr<FileDescriptor>,
    const google::protobuf::RepeatedPtrField<InstallOperation>&,
    const google::protobuf::RepeatedPtrField<CowMergeOperation>&,
    uint64_t,
    android::snapshot::CowWriter*,
    uint64_t,
    bool) {
  return false;
}

}  // namespace chromeos_update_engine
