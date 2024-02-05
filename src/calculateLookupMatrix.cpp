#include <Rcpp.h>
using namespace Rcpp;
 
// [[Rcpp::export]]
NumericMatrix calculateLookupMatrix(int length, NumericMatrix daten, NumericMatrix lookup) {
  
  for (int i = 1; i < length; i++) {
    for (int j = 0; j < i; j++) {
      double sumSquaredDiff = 0.0;
      
      // Calculate the sum of squared differences
      for (int k = 0; k < daten.ncol(); k++) {
        double diff = daten(i, k) - daten(j, k);
        sumSquaredDiff += diff * diff;
      }
      
      // Assign the calculated value to the lookup matrix
      lookup(i, j) = sumSquaredDiff;
      lookup(j, i) = sumSquaredDiff;
    }
  }
  
  return lookup;
}
