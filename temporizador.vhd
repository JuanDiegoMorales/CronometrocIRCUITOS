LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY temporizador is
port (
clk, reset, enable, alarm : IN std_logic;
d,e : OUT std_logic_vector(6 downto 0)
);
END ENTITY;

Architecture arch_1 of temporizador is

signal cnt : unsigned (5 downto 0);
signal UNIT : unsigned (5 downto 0);
signal DEC : unsigned (5 downto 0);

begin
process (cnt) begin
UNIT <= cnt mod 10;
case UNIT is
when "000000" =>d<= "0000001";
when "000001" =>d<= "1001111";
when "000010" =>d<= "0010010";
when "000011" =>d<= "0000110";
when "000100" =>d<= "1001100";
when "000101" =>d<= "0100100";
when "000110" =>d<= "0100000";
when "000111" =>d<= "0001111";
when "001000" =>d<= "0000000";
when "001001" =>d<= "0000100";
when others  =>d<= "1111111";
end case;
end process;

process (cnt) begin
DEC <= cnt / 10;
case DEC is
when "000001" =>e<= "1001111";
when "000010" =>e<= "0010010";
when "000011" =>e<= "0000110";
when others  =>e<= "1111111";
end case;
end process;

pascendente : process (clk,reset)is
begin
if reset = '1' then
cnt<=(others =>'0');
elsif clk'event and clk='1' then
if enable= '1' then
if alarm = '1' then

cnt <= cnt + 1;
else 
cnt <= "100011";
cnt <= cnt - 1;
End if;
End if;
End if;
End process;


End arch_1;