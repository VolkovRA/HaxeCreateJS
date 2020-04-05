package createjs.graphics;

import js.html.CanvasRenderingContext2D;

/**
 * Sets or clears the stroke dash pattern.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Graphics.StrokeDash.html
 * Documentation: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/setLineDash
 * @author VolkovRA
 */
@:native("createjs.Graphics.StrokeDash")
extern class StrokeDash implements ICommand 
{
	/**
	 * Create a new StrokeDash command.
	 * @param	segments	An array specifying the dash pattern, alternating between line and gap.
	 * 						For example, [20,10] would create a pattern of 20 pixel lines with 10 pixel gaps between them.
	 * 						Passing null or an empty array will clear the existing stroke dash.
	 * @param	offset		The offset of the dash pattern.
	 * 						For example, you could increment this value to create a "marching ants" effect.
	 */
	public function new(segments:Array<Float> = null, offset:Float = 0);
	
	/**
	 * An array specifying the dash pattern, alternating between line and gap.
	 * For example, [20,10] would create a pattern of 20 pixel lines with 10 pixel gaps between them.
	 * Passing null or an empty array will clear the existing stroke dash.
	 */
	public var segments:Array<Float>;
	
	/**
	 * The offset of the dash pattern.
	 * For example, you could increment this value to create a "marching ants" effect.
	 */
	public var offset:Float;
	
	/**
	 * Execute the Graphics command in the provided Canvas context.
	 * @param	context	Provided Canvas context.
	 * @param	data	Optional data that is passed to graphics command exec methods.
	 * 					When called from a Shape instance, the shape passes itself as the data parameter.
	 * 					This can be used by custom graphic commands to insert contextual data.
	 */
	function exec(context:CanvasRenderingContext2D, data:Dynamic = null):Void;
}