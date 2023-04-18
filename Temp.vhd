LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Temp IS
  port (display : out STD_LOGIC_VECTOR (7 downto 0);
        clk, reset, enc : in STD_LOGIC;
		  An : out STD_LOGIC_VECTOR(3 downto 0);
end Temp;
 
architecture reloj of temp is
 signal contador : std_LOGIC_VECTOR (3 downto 0) :="0000";
 signal segundos : std_LOGIC_VECTOR (13 downto 0) :="00000000000000";
 signal contador1 : std_LOGIC_VECTOR (3 downto 0) :="0000";
 signal DecSeg : std_LOGIC_VECTOR (9 downto 0) :="0000000000";
 signal contador2 : std_LOGIC_VECTOR (3 downto 0) :="0000";
 signal CentSeg : std_LOGIC_VECTOR (7 downto 0) :="00000000";
 signal Anodos : std_LOGIC_VECTOR (1 downto 0) :="00";
 
begin 
  Process (clk, reset, contador, segundos)
  begin
  if (clk'event and clk = '1') then
   if reset = '0' then
    contador <= "0000";
    segundos <= "00000000000000";
    contador1 <= "0000";
    DecSeg <= "0000000000";
  else
  
  Anodos <= Anodos + 1;
   if Anodos= "11" then
    Anodos <= "00";
   end if;
	
 case Anodos is
  when "00"=> if segundos = "10011100010000" then
    contador <= contador + 1;
	 segundos <= "00000000000000";
	  if contador = "1001" then
	   contador <= "0000";
	  end if;
	  else
	  
	 segundos <= segundos + 1;
	 end if;
	 
	 An <= "1011";
	  case contador is
	  when "0000" => display <= "00000010"
	  when "0001" => display <= "10011110"
	  when "0010" => display <= "00100100"
	  when "0011" => display <= "00001100"
	  when "0100" => display <= "10011000"
	  when "0101" => display <= "01001000"
	  when "0110" => display <= "01000000"
	  when "0111" => display <= "00011110"
	  when "1000" => display <= "00000000"
	  when others => display <= "00011000"
	  
	  end case;
	  
when "01" => if CentSeg = "00111000" then
contador2 <= contador2 + 1;
CentSeg <= "00000000";
  if contador2 = "0000" then
    contador2 <= "0000";
  end if;
   else 
   CentSeg <= CentSeg + 1;
  end if;

An <= "1110";
case contador2 is
    when "0000" => display <= "00000010"
	 when "0001" => display <= "10011110"
	 when "0010" => display <= "00100100"
	 when "0011" => display <= "00001100"
	 when "0100" => display <= "10011000"
	 when "0101" => display <= "01001000"
	 when "0110" => display <= "01000000"
	 when "0111" => display <= "00011110"
	 when "1000" => display <= "00000000"
	 when others => display <= "00011000"
  end case;
  
 when others=> if DecSeg = "1111101000" then
 contador1 <= contador1 + 1;
 decSeg <= "0000000000";
  if contador1 = "1001" then
  contador1 <= "0000";
  end if;
  else

  DecSeg <= DecSeg + 1;
  end if;
  An <= "1101";

case contador1 is

    when "0000" => display <= "00000010"
	 when "0001" => display <= "10011110"
	 when "0010" => display <= "00100100"
	 when "0011" => display <= "00001100"
	 when "0100" => display <= "10011000"
	 when "0101" => display <= "01001000"
	 when "0110" => display <= "01000000"
	 when "0111" => display <= "00011110"
	 when "1000" => display <= "00000000"
	 when others => display <= "00011000"
    end case;
   end case;
  end if;
 end if;
end process;

end reloj;
