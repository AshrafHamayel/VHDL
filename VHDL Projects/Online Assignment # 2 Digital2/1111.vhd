library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity multiplier is
 port( CLK : in std_logic;
 A, B : in std_logic_vector(3 downto 0);
 P : out std_logic_vector(7 downto 0));
end multiplier;
architecture behavioral of multiplier is    
begin
process(clk)
variable x : std_logic_vector (7 downto 0):=(others=> '0');
variable G :  integer range 0 to 15;


	begin
    
    if ( CLK' event and CLK = '1' ) then 
    
       
		 G:=conv_integer(B);
  
            for I in 0 to G loop
                X:=X+A;
             end loop;
       
       
      else
      X:="00000000";
       
		end if ;
        P<=X;
	end process;
end behavioral;





