// class CircularMemory
// This class implements a cicular buffer with with 2 int typed pointers
class CircularMemory
{
  var cells : array<int>;
  var read_position : int;
  var write_position : int;
  var isFlipped : bool;

  constructor Init(cap : int)
  //missing some pre-conditions here
  ensures 0<=cap
  {
    cells := new int[cap];
    read_position, write_position := 0, 0;
    isFlipped := false;
  }

  // Valid is the class invariant we would like to maintain
  // for any CircularMemory at any moment of its lifetime

  predicate Valid()
    reads this
  {

  // Think of some constraints on: 
    cell.Length>0
    write_position < cell.Length && write_position >=0	
   read_position < cell.Length && read_position >=0	
  }


  // A predicate indicating no more Read available
  predicate isEmpty()
    reads this
  {
  write_position == read_position
  }

  //A predicate indicating no more Write should be allowed
  predicate isFull()
    reads this
  {
  write_position == cell.Length-1
  }

 method Read() returns (isSuccess : bool, content : int)
    modifies this
    requires Valid()
    ensures  Valid()
    ensures  isSuccess ==> ...
    ensures !isSuccess ==> ...
  {
    if(isFlipped)
    {
            isSuccess :=true;
            content := cell[read_position]
            if(read_position==cell.Length-1){
                read_position:=0;
                isFlipped:=false;
            }else{
                read_position:=read_position + 1;
            }
        }
    }
    else // not flipped
    {
    if(read_position==write_position){
       isSuccess := false;
        content := 0;
    }else{
        isSuccess := true ;
        content := cell[read_position];
        read_position := read_position +1;
    }
    }
  }


}