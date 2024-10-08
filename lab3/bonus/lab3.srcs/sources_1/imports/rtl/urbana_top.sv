module urbana_top (
    input logic [15:0] SW,
    output logic [15:0] LED
    //output logic [2:0][7:0] RGB0, RGB1 
);

  //assign RGB0[0][7:0] = 8'b0;
  //assign RGB0[1][7:0] = 8'b0;
  //assign RGB0[2][7:0] = 8'b0;
  
  //assign RGB1[0][7:0] = 8'b0;
  //assign RGB1[1][7:0] = 8'b0;
  //assign RGB1[2][7:0] = 8'b0;

  assign LED[7:0] = SW[7:0];
  //assign LED[15:8] = 8'b0;

  alu alu0 (
    .x(SW[3:0]),
    .y(SW[7:4]),
    .m(SW[15:14]),
    .s(SW[13:12]),
    .z(LED[15:8])
  );
   

endmodule

