package createjs.utils;

import createjs.display.DisplayObject;
import createjs.display.StageGL;
import js.html.webgl.WebGL2RenderingContext;
import js.lib.Function;

/**
 * A utility and helper class designed to work with StageGL to help investigate and test performance or display problems.
 * It contains logging functions to analyze behaviour and performance testing utilities.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/WebGLInspector.html
 * @author VolkovRA
 */
@:native("createjs.WebGLInspector")
extern class WebGLInspector 
{
	/**
	 * Create a new WebGLInspector.
	 * @param	stage	The default stage to use when none is supplied.
	 */
	public function new(stage:StageGL);
	
	
	
	////////////////
	//   STATIC   //
	////////////////
	
	/**
	 * Utility function for use with {{#crossLink "logDepth"))((/crossLink}}.
	 * Logs an item's position and registration.
	 * Useful to see if something is being forced off screen or has an integer position.
	 * @param	prepend	The string to show before the item, usually formatting for a tree view.
	 * @param	item	The item we're currently logging about.
	 */
	static public function dispProps(prepend:String, item:DisplayObject):Void;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Perform all of the logging reports at once.
	 * @param	stage	The stage to log information for.
	 */
	public function log(stage:StageGL = null):Void;
	
	/**
	 * Examine the context and provide information about its capabilities.
	 * @param	context	The WebGL context to inspect.
	 */
	public function logContextInfo(context:WebGL2RenderingContext):Void;
	
	/**
	 * Recursively walk the entire display tree, log the attached items, and display it in a tree view.
	 * @param	children	The children array to walk through.
	 * @param	prepend		What to prepend to this output from this point onwards.
	 * @param	customLog	Which logging function to use, mainly for filtering or formatting output.
	 * 						Fallback hierarchy is customLog -> alternateOutput -> console.log.
	 */
	public function logDepth(children:Array<DisplayObject> = null, prepend:String, customLog:Function):Void;
	
	/**
	 * Simulate renders and watch what happens for textures moving around between draw calls.
	 * A texture moving between slots means it was removed and then re-added to draw calls.
	 * Performance may be better if it was allowed to stay in place.
	 * @param	stage	The stage to log information for.
	 */
	public function logTextureFill(stage:StageGL = null):Void;
	
	/**
	 * Replace the stage's Draw command with an empty draw command.
	 * This is useful for testing performance, and ignoring rendering.
	 * @param	stage	The stage to log information for.
	 * @param	enabled	Force enabled. If left undefined, it will toggle.
	 */
	public function toggleGPUDraw(stage:StageGL = null, enabled:Bool):Void;
}