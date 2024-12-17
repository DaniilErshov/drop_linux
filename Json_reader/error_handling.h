#include "assert.h"
#define JSON_ASSERT_UNREACHABLE assert(false)
#define JSON_ASSERT(condition) assert(condition);  // @to do <= change this into an exception throw
#define JSON_ASSERT_MESSAGE(condition, message)  if (!(condition)) { printf("%s\n", message); assert(condition); }
