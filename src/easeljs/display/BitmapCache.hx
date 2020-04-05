package easeljs.display;

import easeljs.geom.Rectangle;
import js.html.CanvasRenderingContext2D;

/**
 * The BitmapCache is an internal representation of all the cache properties and logic required
 * in order to "cache" an object. This information and functionality used to be located on a cache
 * method in DisplayObject, but was moved to its own class.
 * 
 * Caching in this context is purely visual, and will render the DisplayObject out into an image
 * to be used instead of the object. The actual cache itself is still stored on the target with the
 * cacheCanvas. Working with a singular image like a Bitmap there is little benefit to performing a
 * cache as it is already a single image. Caching is best done on containers containing multiple
 * complex parts that do not move often, so that rendering the image instead will improve overall
 * rendering speed. A cached object will not visually update until explicitly told to do so with a
 * call to update, much like a Stage. If a cache is being updated every frame it is likely not
 * improving rendering performance. Cache are best used when updates will be sparse.
 * 
 * Caching is also a co-requisite for applying filters to prevent expensive filters running constantly
 * without need, and to physically enable some effects. The BitmapCache is also responsible for
 * applying filters to objects and reads each Filter due to this relationship. Real-time Filters are
 * not recommended performance wise when dealing with a Context2D canvas. For best performance and to
 * still allow for some visual effects use a compositeOperation when possible.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/BitmapCache.html
 * @author VolkovRA
 */
@:native("createjs.BitmapCache")
extern class BitmapCache
{
	/**
	 * Create a new BitmapCache.
	 */
	public function new();
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Track how many times the cache has been updated, mostly used for preventing duplicate cacheURLs.
	 * This can be useful to see if a cache has been updated.
	 * Default: 0
	 */
	public var cacheID:Float;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * Actually create the correct cache surface and properties associated with it. Caching and it's
	 * benefits are discussed by the cache function and this class description. Here are the detailed
	 * specifics of how to use the options object.
	 * 
	 *   If options.useGL is set to "new" a StageGL is created and contained on this for use when rendering the cache.
	 *   If options.useGL is set to "stage" if the current stage is a StageGL it will be used. If not then it will default to "new".
	 *   If options.useGL is a StageGL instance it will not create one but use the one provided.
	 *   If options.useGL is undefined a Context 2D cache will be performed.
	 * 
	 * This means you can use any combination of StageGL and 2D with either, neither, or both the stage and cache being WebGL.
	 * Using "new" with a StageGL display list is highly unrecommended, but still an option. It should be avoided due to
	 * negative performance reasons and the Image loading limitation noted in the class complications above.
	 * 
	 * When "options.useGL" is set to the parent stage of the target and WebGL, performance is increased by using "RenderTextures"
	 * instead of canvas elements. These are internal Textures on the graphics card stored in the GPU. Because they are no longer
	 * canvases you cannot perform operations you could with a regular canvas. The benefit is that this avoids the slowdown of
	 * copying the texture back and forth from the GPU to a Canvas element. This means "stage" is the recommended option when available.
	 * 
	 * A StageGL cache does not infer the ability to draw objects a StageGL cannot currently draw, i.e. do not use a WebGL context
	 * cache when caching a Shape, Text, etc.
	 * @param	x		The x coordinate origin for the cache region.
	 * @param	y		The y coordinate origin for the cache region.
	 * @param	width	The width of the cache region.
	 * @param	height	The height of the cache region.
	 * @param	scale	The scale at which the cache will be created. For example, if you cache a vector shape using
	 * 					myShape.cache(0,0,100,100,2) then the resulting cacheCanvas will be 200x200 px. This lets you scale and rotate
	 * 					cached elements with greater fidelity. Default is 1.
	 * @param	options	Specify additional parameters for the cache logic.
	 */
	public function define(x:Float, y:Float, width:Float, height:Float, scale:Float = 1, options:CacheConfig = null):Void;
	
	/**
	 * Use context2D drawing commands to display the cache canvas being used.
	 * @param	context	The context to draw into.
	 * @return	Whether the draw was handled successfully.
	 */
	public function draw(context:CanvasRenderingContext2D):Bool;
	
	/**
	 * Determine the bounds of the shape in local space.
	 */
	public function getBounds():Rectangle;
	
	/**
	 * Returns a data URL for the cache, or null if this display object is not cached.
	 * Uses cacheID to ensure a new data URL is not generated if the cache has not changed.
	 * @return	The image data url for the cache.
	 */
	public function getCacheDataURL():String;
	
	/**
	 * Returns the bounds that surround all applied filters, relies on each filter to describe how it changes bounds.
	 * @param	target	The object to check the filter bounds for.
	 * @param	output	Optional parameter, if provided then calculated bounds will be applied to that object.
	 * @return	Bounds object representing the bounds with filters.
	 */
	public function getFilterBounds(target:DisplayObject, output:Rectangle = null):Rectangle;
	
	/**
	 * Reset and release all the properties and memory associated with this cache.
	 */
	public function release():Void;
	
	/**
	 * Directly called via updateCache, but also internally.
	 * This has the dual responsibility of making sure the surface is ready to be drawn to, and performing the draw.
	 * For full details of each behaviour, check the protected functions _updateSurface and _drawToCache respectively.
	 * @param	compositeOperation The DisplayObject this cache is linked to.
	 */
	public function update(compositeOperation:CompositeOperation = null):Void;
	
	/**
	 * Returns a string representation of this BitmapCache.
	 * @return A string representation of the instance.
	 */
	public function toString():String;
}