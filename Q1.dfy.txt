
/* 
Answer Question 1a here:

*/
method M(x : int, y : int) returns (a : int, b : int) 
  ensures a > b;
{
  if (x > y)
   {a:= x;
    b := y;}
  else
   {a := y; 
    b := x;}
}