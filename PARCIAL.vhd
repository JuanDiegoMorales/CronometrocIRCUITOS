library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



ENTITY PARCIAL IS



PORT (
up: in std_logic;
down: in std_logic;
start: in std_logic;
DEC7CONTADOR :in std_logic;
reset : IN std_logic;
enable: IN std_logic;
d1: out std_logic_vector(6 downto 0);
d2: out std_logic_vector(6 downto 0);

unidad:in std_logic


);

END PARCIAL;

architecture CONTADOR of PARCIAL is

SIGNAL clk : std_ulogic;
signal aux : std_ulogic;
signal s:    std_ulogic;
signal clkout:  std_ulogic;

begin

process(clk)
begin
if rising_edge(clk) then
 if (DEC7CONTADOR = "24999999")then
 aux <= NOT (aux);
 DEC7CONTADOR <= 0;
  else
  DEC7CONTADOR  <= DEC7CONTADOR + 1;
  end if;
  end if;
 
  clkout <= aux;
  end process;
 
 process(up,down,reset,start)
 begin
 if (reset='0')then
 s<=50;
 elsif (clkout ' event and clkout='1')then
  if (up = '0' and down = '1' and s/= 50 and start='0')then
  s<=s+1;
 elsif (up = '1' and down ='0' and s/=0 and start= '0')then
 
  s<=s-1;
  end if;
 
  if (start = '1') then
  if(s/=0)then
  s<=s-1;
  end if;
  end if;
  end if;
  end process;
 
  process(reset)
  begin
  unidad <=s mod 10;
  if (s<10)then
  d2<="0000001";
  else
  case (s-unidad)is
  when 10 => d2 <= "1001111";
  when 20 => d2 <= "0010010";
  when 30 => d2 <= "0000110";
  when 40 => d2 <= "0100100";
  when others => d2 <= "0000001";
  end case;
  end if;
 
  case unidad is
  when 0 => d1 <= "0000001";
  when 1 => d1 <= "1001111";
  when 2 => d1 <= "0010010";
  when 3 => d1 <= "0000110";
  when 4 => d1 <= "1001100";
  when 5 => d1<= "0100100";
  when 6 => d1 <= "0100000";
  when 7 => d1 <= "0001111";
  when 8 => d1 <= "0000000";
  when 9 => d1 <= "0000100";
  when  others => d2 <= "0000001";
  end case;
  end process;
  end CONTADOR;