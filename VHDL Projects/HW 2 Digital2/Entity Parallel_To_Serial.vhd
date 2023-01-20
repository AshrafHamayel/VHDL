library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
Entity Parallel_To_Serial is
 port(
 CLK, RESET, WR: in std_logic;
 
 Data : in std_logic_vector(6 downto 0) ;
 
 TXD : out std_logic );
 
end  Parallel_To_Serial ;


architecture BEHAVIOR of Parallel_To_Serial is 

type STATE_TYPE is (S0, S1, S2, S3,S4);

signal CURRENT_STATE, NEXT_STATE: STATE_TYPE;

signal R : std_logic_vector (6 downto 0);

signal N : std_logic_vector (2 downto 0);
signal P : std_logic ;

begin
  
  
  ------------process (1)--------------
  -------------------------------------
process(CLK)

begin
if( CLK 'event and CLK = '1') then
if (CURRENT_STATE=S0 and WR='1') then
R<=Data;
N<="111";
P<='0';

elsif (CURRENT_STATE=S1) then
TXD<='0';
  
  
elsif (CURRENT_STATE=S2 ) then
TXD<=R(0);
R <= '0'&R(6)&R(5)&R(4)&R(3)&R(2)&R(1) ;
N<=N - '1';
P<= P XOR R(0);
elsif ( CURRENT_STATE=S3 )then
TXD<=P;

else
TXD<='1';

end if;
end if;
end process;
----------------process (2)----------------
--------------------------------------------
process(CURRENT_STATE,WR,N)
begin
case CURRENT_STATE is
when S0 =>
if WR = '0' then
NEXT_STATE <= S0;
else
NEXT_STATE <= S1;
end if;

when S1 =>

NEXT_STATE <= S2;

when S2 =>
if (N = "000") then
NEXT_STATE <= S3;
else
NEXT_STATE <= S2;
end if;
when S3 =>
NEXT_STATE <= S4;

when S4 =>
NEXT_STATE <= S0;

end case;

end process;
----------------process (3)----------------
--------------------------------------------
process(RESET, CLK)

begin
if (RESET = '0' )then 
CURRENT_STATE <= S0;
else
if( CLK 'event and CLK = '1') then

CURRENT_STATE <= NEXT_STATE;
end if;
end if;
end process;
-------------------------------------------------
-------------------------------------------------
end ;








