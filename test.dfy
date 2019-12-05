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
  ensures cap >=0;
  requires cap >=0;
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
    cells.Length>0 &&
    write_position < cells.Length && write_position >=0 &&	
   read_position < cells.Length && read_position >=0 
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
  write_position == cells.Length-1
  }

 method Read() returns (isSuccess : bool, content : int)
    modifies this
    requires Valid();
    ensures  Valid();
    ensures  isSuccess ==> content == old(cells[read_position]);
    ensures !isSuccess ==> content==0 && read_position == old(read_position);
  {
    if(write_position==read_position){
       isSuccess := false;
        content := 0;
    }
    else{
        isSuccess :=true;
        content := cells[read_position];
      if(isFlipped)
        {
            if(read_position == cells.Length-1){
                read_position:=0;
                isFlipped:=false;
                
            }
            else
             {
             read_position := read_position+1;
             
                
            }
        }
    
    else
    {
      if(read_position <cells.Length-1){
        read_position := read_position +1;
      }
      }
    }
  }
  
  method Write(input : int) returns (isSuccess : bool)
    modifies this ,cells;
    requires Valid()
    ensures  Valid()
    ensures  isSuccess ==> cells[ old(write_position) ] == input;
    ensures !isSuccess ==> write_position == old(write_position)
  {
    if(read_position == write_position && cells[read_position]!=0)
    {
        isSuccess := false;
    } 
    else{
      if(isFlipped)
       {
             if(write_position >= read_position){
              isSuccess := false;
           } 
            else
            {
              cells[write_position]:= input;
              write_position:=write_position+1;
                isSuccess := true;

            }
        }
      else 
        {
          if(write_position <= read_position){
          isSuccess := false;

        }else{
            isSuccess:=true;
            cells[write_position]:= input;
          if(write_position==cells.Length-1){
           
            write_position:=0;
            isFlipped:=true;          
          }
          else{
   write_position:=write_position +1;
          }
       

        }
      
      }
    }
  }
}


