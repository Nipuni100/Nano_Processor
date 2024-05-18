----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 02:04:37 PM
-- Design Name: 
-- Module Name: Nano - Behavioral
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

entity Nano is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           C : out STD_LOGIC:='0';
           Z : out STD_LOGIC;
           R7_out : out STD_LOGIC_VECTOR (3 downto 0);
           S7_seg : out STD_LOGIC_VECTOR (6 downto 0);
           Anode : out STD_LOGIC_VECTOR (3 downto 0));
end Nano;

architecture Behavioral of Nano is
    component Way2_4bit_MUX
       Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --LS=0; D = A
              B : in STD_LOGIC_VECTOR (3 downto 0);
              LS : in STD_LOGIC;
              D : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Register_Bank
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
    end component;
    
    component Adder_Subtractor_2
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               C_in : in STD_LOGIC;
               C_out : out STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Zero : out STD_LOGIC);
    end component;
    
    component  Way8_4_MUX
        Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
               D1 : in STD_LOGIC_VECTOR (3 downto 0);
               D2 : in STD_LOGIC_VECTOR (3 downto 0);
               D3 : in STD_LOGIC_VECTOR (3 downto 0);
               D4 : in STD_LOGIC_VECTOR (3 downto 0);
               D5 : in STD_LOGIC_VECTOR (3 downto 0);
               D6 : in STD_LOGIC_VECTOR (3 downto 0);
               D7 : in STD_LOGIC_VECTOR (3 downto 0);
               S : in STD_LOGIC_VECTOR (2 downto 0);
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component RCA_3
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               --B : in STD_LOGIC_VECTOR (2 downto 0);
               S : out STD_LOGIC_VECTOR (2 downto 0);
               C_in : in STD_LOGIC;
               C_out : out STD_LOGIC);
    end component;
    
    component Way2_3_Mux
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               B : in STD_LOGIC_VECTOR (2 downto 0);
               JF : in STD_LOGIC;
               To_PC : out STD_LOGIC_VECTOR (2 downto 0));
               
    end component;
    
    component LUT_16_7
       Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
              data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    component Program_Counter
        Port ( Input : in STD_LOGIC_VECTOR (2 downto 0):= "000";
               Output : out STD_LOGIC_VECTOR (2 downto 0);
               Clk : in STD_LOGIC;
               Reset : in STD_LOGIC);
    end component;
    
    component Instruction_Decoder
        Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
               Reg_Chk : in STD_LOGIC_VECTOR (3 downto 0);
               AS_S : out STD_LOGIC;
               LS : out STD_LOGIC;
               Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
               Reg_S1 : out STD_LOGIC_VECTOR (2 downto 0);
               Reg_S2 : out STD_LOGIC_VECTOR (2 downto 0);
               JF : out STD_LOGIC;
               J_AD : out STD_LOGIC_VECTOR (2 downto 0);
               Im_Val : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
     
    component ROM
        Port ( PC : in STD_LOGIC_VECTOR (2 downto 0);
               Ins : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    component Slow_Clk
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;
    

    signal  Clk_slow, Load_S, AS_S, J_F : std_logic;
    signal AS_out, I_val, Reg_in, R0, R1, R2, R3, R4, R5, R6, R7, Y1, Y2 : 
    std_logic_vector (3 downto 0);
    signal Reg_En, Reg_S1, Reg_S2, MUX2_3_in, J_Ad, PC_in, PC_out : std_logic_vector 
        (2 downto 0);
    signal I_Bus: std_logic_vector (11 downto 0);

begin
Way2_4bit_MUX_0:Way2_4bit_MUX
       Port map( A => AS_out,
              B => I_val,
              LS => Load_S,
              D => Reg_in);
              
Reg_Bank : Register_Bank
        port map(Clk => Clk_slow,
               Res => Res,
               Reg_In => Reg_in,
               En => Reg_En,
               R0 => R0,
               R1 => R1,
               R2 => R2,
               R3 => R3,
               R4 => R4,
               R5 => R5,
               R6 => R6,
               R7 =>R7);
               
AS_Unit:  Adder_Subtractor_2
          Port map ( A => Y1,
                 B =>Y2,
                 C_in => AS_S,
                 C_out => C,
                 S => AS_out,
                 Zero => Z);

Way8_4_MUX_0:Way8_4_MUX
         Port map ( D0 => R0,
                D1 => R1,
                D2 => R2,
                D3 => R3,
                D4 => R4,
                D5 => R5,
                D6 => R6,
                D7 => R7,
                S => Reg_S1,
                Y => Y1);

Way8_4_MUX_1:Way8_4_MUX
         Port map ( D0 => R0,
                D1 => R1,
                D2 => R2,
                D3 => R3,
                D4 => R4,
                D5 => R5,
                D6 => R6,
                D7 => R7,
                S => Reg_S2,
                Y => Y2);
 
RCA_3_0 : RCA_3 
          Port map( A => PC_out,
               S =>MUX2_3_in,
               C_in =>'0'); 
               
               
Way2_3_Mux_0: Way2_3_Mux
  Port map(A => J_Ad,
           B => MUX2_3_in,
           JF =>J_F,
           To_PC => PC_in);
           
LUT_16_7_0 : LUT_16_7
    Port map (
        address => R7,
        data=> S7_seg);
               
PC : Program_Counter
    Port map (
       Input =>PC_in,
       Output => PC_out,
       Clk => CLk_slow,
       Reset => Res);

I_Decoder: Instruction_Decoder
        Port map 
        ( Ins => I_Bus,
           Reg_Chk => Y1,
           AS_S =>AS_S,
           LS =>Load_S,
           Reg_EN => Reg_En,
           Reg_S1 =>Reg_S1,
           Reg_S2=> Reg_S2,
           JF => J_F,
           J_AD => J_Ad,
           Im_Val => I_val);
           
ROM_0 : ROM
    POrt map(
       PC => PC_out,
       Ins => I_Bus);
     
S_clk: Slow_Clk
    Port map
    ( Clk_in => Clk,
      Clk_out => Clk_slow);
      
R7_out <=R7;
Anode <="1110";
        
end Behavioral;

