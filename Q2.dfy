method ComputeFact(n : nat) returns (res : nat)
  requires n > 0;
  ensures res == fact(n);
 {
  res := 1;
  var i := 2;
  while (i <= n)
  invariant fact(i) == res * i && i-2 <n 
   decreases  n - i
  {
    res := res * i;
    i := i + 1;
  }
 }

 function fact( n : nat): nat
 decreases  n
 requires n >0
 {
 if n==1 then 1
 else n * fact(n-1)
 }