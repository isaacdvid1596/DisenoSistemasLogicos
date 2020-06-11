module MultS4Bits(
    input [3:0] x,
    input [3:0] y,
    output [7:0] prod
);
    //first term

    wire splitx0,splitx1,splitx2,splitx3;

    assign splitx0 = x[0];
    assign splitx1 = x[1];
    assign splitx2 = x[2];
    assign splitx3 = x[3];

    wire splity0,splity1,splity2,splity3;

    assign splity0 = y[0];
    assign splity1 = y[1];
    assign splity2 = y[2];
    assign splity3 = y[3];

    wire [3:0] signx = {splitx3,1'd0,1'd0,1'd0};
    wire [3:0] signy = {splity3,1'd0,1'd0,1'd0};

    wire [7:0] resultxy;

    MultU4Bits mult4bitsfirstterm(signx,signy,resultxy);

    //second term


    wire [3:0] offsetx,offsety;

    assign offsetx = {1'd0,splitx2,splitx1,splitx0};
    assign offsety = {1'd0,splity2,splity1,splity0};

    wire [3:0] offsetx2,offsety2;
    assign offsetx2 = ~(offsetx+1);
    assign offsety2 = ~(offsety+1);

    wire [7:0] resultxy2;

    MultU4Bits mult4bitsoffsetx(resultxy, offsetx2, resultxy2);
    MultU4Bits mult4bitsoffsety(resultxy, offsety2, resultxy2);


    //third term






    //fourth term



endmodule
