#pragma once

#include "base/logging.h"

namespace google {
inline void InitGoogleLogging(const char*) {}
}

#ifndef VLOG
#define VLOG(verbose_level) LOG(INFO)
#endif
