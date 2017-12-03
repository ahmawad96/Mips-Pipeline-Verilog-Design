module Hazard_Detection_Unit (ID_ExMemRead,ID_Ex_Rt,IF_ID_Instr,holdPC,holdIF_ID,ORgate_In);
  
  input ID_ExMemRead;
  input [4:0] ID_Ex_Rt;
  input [31:0] IF_ID_Instr;
  output reg holdPC, holdIF_ID, ORgate_In;
  
  always@(ID_ExMemRead or ID_Ex_Rt or IF_ID_Instr)
    begin
      if (ID_ExMemRead)
        begin
          if(ID_Ex_Rt==IF_ID_Instr[25:21] || ID_Ex_Rt==IF_ID_Instr[20:15] )
            begin
              holdPC<=1;
              holdIF_ID<=1;
              ORgate_In<=1;
              
            end
          
          else
            begin
               holdPC<=0;
              holdIF_ID<=0;
              ORgate_In<=0;
              
            end
          
        end
      
      
    end
  
  
endmodule