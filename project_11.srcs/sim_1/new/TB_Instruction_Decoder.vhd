----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:37:14 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is
component Instruction_Decoder
Port(
          Ins : in STD_LOGIC_VECTOR (11 downto 0);
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
 
 signal Ins : STD_LOGIC_VECTOR (11 downto 0);
 signal Reg_Chk, Im_Val : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_EN,Reg_S1, Reg_S2, J_AD : STD_LOGIC_VECTOR (2 downto 0);
 signal LS , AS_S,JF : STD_LOGIC;
   

begin
UUT : Instruction_Decoder
    PORT MAP(
         Ins => Ins,
         Reg_Chk => Reg_Chk,
         AS_S => AS_S,
         LS => LS,
         Reg_EN => Reg_EN,
         Reg_S1 => Reg_S1,
         Reg_S2 => Reg_S2,
         JF => JF,
         J_AD => J_AD,
         Im_Val => Im_Val);
 process
 begin
     Reg_Chk <= "0000";
     Ins <= "100010000001";
     wait for 50ns;
     
     Reg_Chk <= "0001";
     Ins <= "100100000011";
     wait for 50ns;

     Ins <= "001110100000";
     wait for 50ns;    
   
     Ins <=  "110100000111";
     wait for 50ns;
               
     Reg_Chk <= "0000";
     Ins <="110000000011";
     wait for 50ns;
end process;
end Behavioral;
