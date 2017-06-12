#include <stdio.h>
#include <stdlib.h>
#include "test.h"

void hello_test() {
  assert_true(32 == 32);
}

int main() {
  const struct CMUnitTest tests[] = {
    cmocka_unit_test(hello_test)
  };

  return cmocka_run_group_tests(tests, NULL, NULL);
}
