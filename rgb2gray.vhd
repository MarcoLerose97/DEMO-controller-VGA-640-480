
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rgb2gray is
    port(
        color_rgb : in  std_logic_vector(11 downto 0);
        gray_rgb  : out std_logic_vector(11 downto 0)
    );
end rgb2gray;

architecture arch of rgb2gray is
    signal r, g, b : unsigned(3 downto 0);
    signal gray    : std_logic_vector(3 downto 0);
    signal gray12  : unsigned(11 downto 0);

    constant RW : unsigned(7 downto 0) := x"35"; -- weight for red
    constant GW : unsigned(7 downto 0) := x"B8"; -- weight for green
    constant BW : unsigned(7 downto 0) := x"12"; -- weight for blue

begin

    r <= unsigned(color_rgb(11 downto 8));
    g <= unsigned(color_rgb(7 downto 4));
    b <= unsigned(color_rgb(3 downto 0));

    gray12 <= r*RW + g*GW + b*BW;

    gray <= std_logic_vector(gray12(11 downto 8));

    gray_rgb <= gray & gray & gray;

end arch;
