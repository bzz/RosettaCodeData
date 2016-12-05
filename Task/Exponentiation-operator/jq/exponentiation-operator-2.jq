def demo(x;y):
  x | [ power_int(y), (log*y|exp) ] ;

demo(2; 3),
demo(2; 64),
demo(1.1; 1024),
demo(1.1; -1024)

# Output:
[8,                      7.999999999999998]
[18446744073709552000,   18446744073709525000]
[2.4328178969536854e+42, 2.4328178969536693e+42]
[4.1104597317052596e-43, 4.1104597317052874e-43]