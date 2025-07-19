#include <benchmark/benchmark.h>

static void BM_Baseline(benchmark::State& state) {
  for (auto _ : state) {
    __asm__("nop");
  }
}
BENCHMARK(BM_Baseline);

static void BM_Treatment(benchmark::State& state) {
  for (auto _ : state) {
    __asm__("nop");
  }
}
BENCHMARK(BM_Treatment);

BENCHMARK_MAIN();
