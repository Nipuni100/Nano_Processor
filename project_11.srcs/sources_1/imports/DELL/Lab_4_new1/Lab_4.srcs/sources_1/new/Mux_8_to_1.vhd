----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2023 04:39:34 PM
-- Design Name: 
-- Module Name: Mux_8_to_1 - Behavioral
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

entity Mux_8_to_1 is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           D : in STD_LOGIC_VECTOR (7 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is

    component Decoder_3_to_8
           port (I :in STD_LOGIC_VECTOR(2 downto 0);
                 EN:in STD_LOGIC;
                 Y: out STD_LOGIC_VECTOR(7 downto 0));
    end component;
    
    signal Inter : std_logic_vector (7 downto 0);
    signal dec_out : std_logic_vector (7 downto 0);

begin
    
    Decoder_3_to_8_0: Decoder_3_to_8
    port map(
    I=> S,
    EN=>EN,
    Y=>dec_out);
    
    Inter<= dec_out and D;
    
    Y<= Inter(0)or
        Inter(1) or
        Inter(2) or
        Inter(3) or
        Inter(4) or
        Inter(5) or
        Inter(6) or
        Inter(7);
    
end Behavioral;
