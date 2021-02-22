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
            centrada, Subs:in bit;
            sumador:out bit_vector(7 downto 0);
            cout:out bit);
end bitAdderSubstractor;

architecture Behavioral of bitAdderSubstractor is
    component FullAdder is
        port (X, Y, Cin: in bit;
                Sum:out bit;
                Cout:out bit);
     end component;
signal C:bit_vector(7 downto 1);
signal SubSignal: bit_vector(7 downto 0);
begin
    SubSignal(0) <= B(0) xor Subs;
    SubSignal(1) <= B(1) xor Subs;
    SubSignal(2) <= B(2) xor Subs;
    SubSignal(3) <= B(3) xor Subs;
    SubSignal(4) <= B(4) xor Subs;
    SubSignal(5) <= B(5) xor Subs;
    SubSignal(6) <= B(6) xor Subs;
    SubSignal(7) <= B(7) xor Subs;
    FA0:FullAdder port map(a(0), SubSignal(0), centrada, sumador(0), C(1));
    FA1:FullAdder port map(a(1), SubSignal(1), C(1), sumador(1), C(2));
    FA2:FullAdder port map(a(2), SubSignal(2), C(2), sumador(2), C(3));
    FA3:FullAdder port map(a(3), SubSignal(3), C(3), sumador(3), C(4));
    FA4:FullAdder port map(a(4), SubSignal(4), C(4), sumador(4), C(5));
    FA5:FullAdder port map(a(5), SubSignal(5), C(5), sumador(5), C(6));
    FA6:FullAdder port map(a(6), SubSignal(6), C(6), sumador(6), C(7));
    FA7:FullAdder port map(a(7), SubSignal(7), C(7), sumador(7), cout);
end Behavioral;
