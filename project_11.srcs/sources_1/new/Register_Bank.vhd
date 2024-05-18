----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 01:22:05 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_Bank is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Reg_In : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is
Component Register_4_bit
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Component;
Component Decoder_3_to_8 
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Component;

Signal y : STD_LOGIC_VECTOR (7 downto 0);

begin
Decoder_3_to_8_1 : Decoder_3_to_8
     Port Map(
          I => En,
          EN => '1',
          Y => y);
        
Register_4_bit_0 : Register_4_bit
     Port Map(
     D => "0000",
     Clk => Clk,
     Res => Res,
     En => y(0),
     Q => R0
     );
Register_4_bit_1 : Register_4_bit
     Port Map(
D => Reg_In,
Clk => Clk,
Res => Res,
En => y(1),
Q => R1
);
Register_4_bit_2 : Register_4_bit
     Port Map(
D => Reg_In,
Clk => Clk,
Res => Res,
En => y(2),
Q => R2
);
Register_4_bit_3 : Register_4_bit
     Port Map(
D => Reg_In,
Clk => Clk,
Res => Res,
En => y(3),
Q => R3
);
Register_4_bit_4 : Register_4_bit
     Port Map(
D => Reg_In,
Clk => Clk,
Res => Res,
En => y(4),
Q => R4
);
Register_4_bit_5 : Register_4_bit
     Port Map(
D => Reg_In,
Clk => Clk,
Res => Res,
En => y(5),
Q => R5
);
Register_4_bit_6 : Register_4_bit
     Port Map(
D => Reg_In,
Clk => Clk,
Res => Res,
En => y(6),
Q => R6
);
Register_4_bit_7 : Register_4_bit
     Port Map(
D => Reg_In,
Clk => Clk,
Res => Res,
En => y(7),
Q => R7
);

end Behavioral;
