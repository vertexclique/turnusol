defmodule Blinker do
	def blink do
		Enum.reduce([1, 2, 3, 4, 5, 6, 7], 0, 
			fn(x, acc) -> TCore.write_high(17)
						  :timer.sleep(100)
						  TCore.write_low(17)
						  :timer.sleep(100) end)
	end
end

TCore.init_output_pin 17
Blinker.blink