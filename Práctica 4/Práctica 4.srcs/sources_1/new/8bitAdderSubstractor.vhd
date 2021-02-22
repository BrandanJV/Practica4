----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Izel Molina & Brandan Jimenez
-- 
-- Create Date: 22.02.2021 13:14:18
-- Design Name: 
-- Module Name: 8bitAdderSubstractor - Behavioral
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

entity bitAdderSubstractor is
    Port (a:in bit_vector(7 downto 0);
            b:in bit_vector(7 downto 0);
            centrada:in bit;
            sumador:out bit_vector(7 downto 0);
            cout:out bit);
end bitAdderSubstractor;

architecture Behavioral of bitAdderSubstractor is
    component FullAdder is
        port (X: in bit;
                Y:in bit;
                Cin:in bit;
                Sum:out bit;
                Cout:out bit);
     end component;
signal C:bit_vector(7 downto 1);
begin
    FA0:FullAdder port map(a(0), b(0), centrada, C(1), sumador(0));
    FA1:FullAdder port map(a(1), b(1), C(1), C(2), sumador(1));
    FA2:FullAdder port map(a(2), b(2), C(2), C(3), sumador(2));
    FA3:FullAdder port map(a(3), b(3), C(3), C(4), sumador(3));
    FA4:FullAdder port map(a(4), b(4), C(4), C(5), sumador(4));
    FA5:FullAdder port map(a(5), b(5), C(5), C(6), sumador(5));
    FA6:FullAdder port map(a(6), b(6), C(6), C(7), sumador(6));
    FA7:FullAdder port map(a(7), b(7), C(7), cout, sumador(7));
end Behavioral;
