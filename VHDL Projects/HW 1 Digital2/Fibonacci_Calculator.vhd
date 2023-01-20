
library IEEE;
use IEEE.std_logic_1164.all;
--use IEEE.std_logic_arith.all;

use IEEE.std_logic_unsigned.all;

entity Fibonacci_Calculator is
 port ( clk : in std_logic;
 data_in : in std_logic_vector (3 downto 0);
 load_enable : in std_logic;
 data_out : out std_logic_vector (9 downto 0));
 
end Fibonacci_Calculator;  



architecture behavioral of Fibonacci_Calculator is 
  -- signal z : std_logic_vector (9 downto 0):=(others=> '0');

   signal m : std_logic_vector (3 downto 0);
    --signal outt : std_logic_vector (9 downto 0);
   
begin
process(clk,load_enable,data_in)
variable x : std_logic_vector (9 downto 0):=(others=> '0');
variable y :  std_logic_vector (9 downto 0):= (0=>'1', others=> '0') ;
variable z : std_logic_vector (9 downto 0):=(others=> '0');




--variable x : integer range 0 to 100;
--variable y :  integer range 0 to 100;
--variable z : integer range 0 to 100;
variable e :  integer range 0 to 15;
	begin
    
   
    --  start if load_enable 
		if (load_enable = '1') then 
        --((
        
        
        if ( CLK' event and CLK = '1' ) then
        --(
         if( data_in = "0000") then
         
             data_out<="0000000000";
                   
                   
        	elsif ( data_in = "0001") then
        		data_out<="0000000001";
                
            else 
            
              z:="0000000000";
              x:="0000000000";
               y:="0000000001";
             m<= data_in;
           -- m<=m-"0001"; 
             e:=conv_integer(m);
            for I in 0 to e-1 loop
             z:=x+y;
              x:=y;
               y:=z;
             end loop;
            
          data_out<=z;
			end if ;
          --)
              end if ;
         --))
 
        	else
        		m<= data_in;
		
  		end if;
        
         --  end  if load_enable
		
	end process;
end behavioral;





