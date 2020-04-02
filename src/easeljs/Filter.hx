package easeljs;

import js.html.CanvasRenderingContext2D;
import js.html.webgl.RenderingContext;
import js.html.webgl.Shader;

/**
 * Base class that all filters should inherit from.
 * Filters need to be applied to objects that have been cached using the cache method.
 * If an object changes, please cache it again, or use updateCache. Note that the filters must be applied before caching.
 * <code>
 * myInstance.filters = [
 *     new ColorFilter(0, 0, 0, 1, 255, 0, 0),
 *     new BlurFilter(5, 5, 10)
 * ];
 * myInstance.cache(0,0, 100, 100);
 * </code>
 * Note that each filter can implement a getBounds method, which returns the margins that need to be applied in order to fully display the filter.
 * For example, the BlurFilter will cause an object to feather outwards, resulting in a margin around the shape.
 * Documentation: https://www.createjs.com/docs/easeljs/classes/Filter.html
 * @author VolkovRA
 */
@:native("createjs.Filter")
extern class Filter
{
	/**
	 * Pre-processed template shader code.
	 * It will be parsed before being fed in into the shader compiler.
	 * This should be based upon StageGL.SHADER_FRAGMENT_BODY_REGULAR
	 */
	public var FRAG_SHADER(default, null):String;
	
	/**
	 * Pre-processed template shader code.
	 * It will be parsed before being fed in into the shader compiler.
	 * This should be based upon StageGL.SHADER_VERTEX_BODY_REGULAR
	 */
	public var VTX_SHADER(default, null):String;
	
	/**
	 * A flag stating that this filter uses a context draw mode and cannot be batched into imageData processing.
	 * Default: false
	 */
	public var usesContext:Bool;
	
	/**
	 * Create a new Filter.
	 */
	public function new();
	
	/**
	 * Applies the filter to the specified context.
	 * @param	context	The 2D context to use as the source.
	 * @param	x		The x position to use for the source rect.
	 * @param	y		The y position to use for the source rect.
	 * @param	width	The width to use for the source rect.
	 * @param	height	The height to use for the source rect.
	 * @param	target	The 2D context to draw the result to. Defaults to the context passed to ctx.
	 * @param	targeX	The x position to draw the result to. Defaults to the value passed to x.
	 * @param	targeY	The y position to draw the result to. Defaults to the value passed to y.
	 * @return	If the filter was applied successfully.
	 */
	public function applyFilter(	context:CanvasRenderingContext2D,
									x:Float,
									y:Float,
									width:Float,
									height:Float,
									?target:CanvasRenderingContext2D,
									?targeX:Float,
									?targeY:Float,
	):Bool;
	
	/**
	 * Returns a clone of this Filter instance.
	 * @return A clone of the current Filter instance.
	 */
	public function clone():Filter;
	
	/**
	 * Provides padding values for this filter.
	 * That is, how much the filter will extend the visual bounds of an object it is applied to.
	 * @param	rectangle If specified, the provided Rectangle instance will be expanded by the padding amounts and returned.
	 * @return	If a rect param was provided, it is returned. If not, either a new rectangle with the padding values, or null if no padding is required for this filter.
	 */
	public function getBounds(?rectangle:Rectangle):Rectangle;
	
	/**
	 * Assign any unique uniforms or other setup functionality here.
	 * @param	gl				The context associated with the stage performing the render.
	 * @param	stage			The stage instance that will be rendering.
	 * @param	shaderProgram	The compiled shader that is going to be used to perform the render.
	 */
	public function shaderParamSetup(gl:RenderingContext, stage:StageGL, shaderProgram:Shader):Void;
	
	/**
	 * Returns a string representation of this Filter.
	 * @return A string representation of the instance.
	 */
	public function toString():String;
}