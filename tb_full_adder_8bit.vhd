 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY tb_full_adder_8bit IS
END tb_full_adder_8bit;
 
ARCHITECTURE behavior OF tb_full_adder_8bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder_8bit
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Cin : IN  std_logic;
         Sum : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(7 downto 0);
   signal Cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder_8bit PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );

   -- Clock process definitions
 stim_proc: process
   begin
		-- Test Case 1: 0 + 0 + 0 = 0
      A <= "00000000"; B <= "00000000"; Cin <= '0';
      wait for 100 ns;	

      -- Test Case 2: 5 + 3 + 0 = 8
      A <= "00000101"; B <= "00000011"; Cin <= '0';
      wait for 100 ns;
 
-- Test Case 3: 15 + 10 + 1 = 26
      A <= "00001111"; B <= "00001010"; Cin <= '1';
      wait for 100 ns;

      -- Test Case 4: 255 + 1 + 0 = 256 (Sum=0, Cout=1)
      A <= "11111111"; B <= "00000001"; Cin <= '0';
      wait for 100 ns;

      wait;
   end process;

END behavior;