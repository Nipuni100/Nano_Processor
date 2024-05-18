----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:19:01 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
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
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

    signal func : STD_LOGIC_VECTOR (1 downto 0);
    signal reg_1 , reg_2: STD_LOGIC_VECTOR (2 downto 0);
    signal I_Val : STD_LOGIC_VECTOR (3 downto 0);
    signal Jump_AD : STD_LOGIC_VECTOR (2 downto 0);
    
    


begin


-- JF <= NOT (Reg_Chk(0) OR Reg_Chk(1) OR Reg_Chk(2) OR Reg_Chk(3) OR NOT(Ins(11)) OR 
--NOT(Ins(10)) );--changed

-- Reg_S1 <= Ins(9 downto 7);
-- Reg_S2 <= Ins(6 downto 4);
 
-- Reg_EN <= Ins(9 downto 7);
 
-- Im_Val <= Ins(3 downto 0);
 
-- LS <= Ins(11) AND NOT(Ins(10));
 
-- AS_S <= Ins(10) AND NOT(Ins(11));--changed
 
-- J_AD <= Ins(2 downto 0);

 process (func,reg_1,reg_2,Jump_AD,I_Val,Reg_Chk)
 begin
 JF <= '0';
 Reg_EN <= "000";
 if  (func = "10") then
    Im_Val <= I_Val;
    Reg_EN <= reg_1;
    LS <= '0';
--    Reg_S1 <= "000";
--    Reg_S2 <= "000";
--    J_AD<="111";
--    AS_S<='1';
    
elsif (func="00") then
    AS_S<='0';
    Reg_S1<=reg_1;
    Reg_S2<=reg_2;
    Reg_EN<=reg_1;
    LS<='1';
    
    
elsif (func="01") then
        AS_S<='1';
        Reg_S1<="000";
        Reg_S2<=reg_1;
        Reg_EN<=reg_1;
        LS<='1';
        
elsif (func="11") then
       
        Reg_S1<=reg_1;
        if (Reg_Chk = "0000") then
            JF <= '1';
            J_AD <= Jump_AD;
            LS <= '0';
        end if ;
 end if ;        


end process;
  
  func <= Ins(11 downto 10);
  reg_1 <= Ins(9 downto 7);
  reg_2 <= Ins(6 downto 4);
  I_Val <= Ins(3 downto 0);
  Jump_AD <= Ins(2 downto 0);         
        

end Behavioral;


