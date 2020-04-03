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
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}