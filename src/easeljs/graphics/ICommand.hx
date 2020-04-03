package easeljs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * A single draw command to canvas.
 * An base interface for all canvas painting operations.
 * @author VolkovRA
 */
@:remove
interface ICommand 
{
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context Provided Canvas context.
	 */
	function exec(context:CanvasRenderingContext2D):Void;
}