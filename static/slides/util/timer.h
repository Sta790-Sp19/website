// [[Rcpp::plugins(cpp11)]]

#ifndef TIMER_H
#define TIMER_H

#include <chrono>

struct timer {
  std::chrono::time_point<std::chrono::high_resolution_clock> start;
  
  timer() { 
    reset();
  }
  
  double tick() {
    auto cur = std::chrono::high_resolution_clock::now();
    return std::chrono::duration_cast<std::chrono::microseconds>(cur - start).count();
  }
  
  void reset() {
    start = std::chrono::high_resolution_clock::now();
  }
};

#endif
