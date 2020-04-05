package easeljs.sheet;

import easeljs.events.EventDispatcher;
import easeljs.geom.Rectangle;

/**
 * Encapsulates the properties and methods associated with a sprite sheet.
 * A sprite sheet is a series of images (usually animation frames) combined into a larger image (or images).
 * For example, an animation consisting of eight 100x100 images could be combined into a single 400x200
 * sprite sheet (4 frames across by 2 high).
 * 
 * <b>Generating SpriteSheet Images</b>
 * Spritesheets can be created manually by combining images in PhotoShop, and specifying the frame size or
 * coordinates manually, however there are a number of tools that facilitate this.
 *   1. Exporting SpriteSheets or HTML5 content from Adobe Flash/Animate supports the EaselJS SpriteSheet format.
 *   2. The popular Texture Packer has EaselJS support.
 *   3. SWF animations in Adobe Flash/Animate can be exported to SpriteSheets using Zoë
 * 
 * <b>Cross Origin Issues</b>
 * <b>Warning:</b> Images loaded cross-origin will throw cross-origin security errors when interacted with using:
 *   1. A mouse.
 *   2. Methods such as getObjectUnderPoint.
 *   3. Filters (see Filter).
 *   4. Caching (see cache).
 * 
 * You can get around this by setting crossOrigin property on your images before passing them to EaselJS, or setting
 * the crossOrigin property on PreloadJS' LoadQueue or LoadItems.
 * <code>
 * var img = new Image();
 * img.crossOrigin="Anonymous";
 * img.src = "http://server-with-CORS-support.com/path/to/image.jpg";
 * </code>
 * 
 * If you pass string paths to SpriteSheets, they will not work cross-origin. The server that stores the image must
 * support cross-origin requests, or this will not work. For more information, check out CORS overview on MDN.
 * 
 * EVENTS
 * Event.COMPLETE	Dispatched when all images are loaded. Note that this only fires if the images were not fully
 * 					loaded when the sprite sheet was initialized. You should check the complete property to prior
 * 					to adding a listener.
 * 
 * Event.ERROR		Dispatched when an image encounters an error. A SpriteSheet will dispatch an error event for
 * 					each image that encounters an error, and will still dispatch a complete event once all images
 * 					are finished processing, even if an error is encountered.
 * 
 * Event.GET_FRAME	Dispatched when getFrame is called with a valid frame index. This is primarily intended for use
 * 					by SpriteSheetBuilder when doing on-demand rendering.
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/SpriteSheet.html
 * Documentation: https://www.codeandweb.com/texturepacker
 * Documentation: https://createjs.com/zoe
 * Documentation: https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS
 * @author VolkovRA
 */
@:native("createjs.SpriteSheet")
extern class SpriteSheet extends EventDispatcher 
{
	/**
	 * Create a new SpriteSheet.
	 * @param	data	An object describing the SpriteSheet data.
	 */
	public function new(data:SpriteSheetFormat);
	
	
	
	////////////////////
	//   PROPERTIES   //
	////////////////////
	
	/**
	 * Returns an array of all available animation names available on this sprite sheet as strings.
	 */
	public var animations(default, null):Array<AnimationName>;
	
	/**
	 * Indicates whether all images are finished loading.
	 */
	public var complete(default, null):Bool;
	
	/**
	 * Specifies the framerate to use by default for Sprite instances using the SpriteSheet.
	 * See the Sprite class framerate for more information.
	 */
	public var framerate:Float;
	
	
	
	/////////////////
	//   METHODS   //
	/////////////////
	
	/**
	 * SpriteSheet cannot be cloned.
	 * A SpriteSheet can be shared by multiple Sprite instances without cloning it.
	 */
	public function clone():SpriteSheet;
	
	/**
	 * Returns an object defining the specified animation.
	 * @param	name	The name of the animation to get.
	 * @return	A generic object with frames, speed, name, and next properties.
	 */
	public function getAnimation(name:AnimationName):Animation;
	
	/**
	 * Returns an object specifying the image and source rect of the specified frame.
	 * @param	index	The index of the frame.
	 * @return	A generic object with image and rect properties. Returns null if the frame does not exist.
	 */
	public function getFrame(index:Int):Frame;
	
	/**
	 * Returns a Rectangle instance defining the bounds of the specified frame relative to the origin.
	 * For example, a 90 x 70 frame with a regX of 50 and a regY of 40 would return:
	 * <code>[x=-50, y=-40, width=90, height=70]</code>
	 * @param	index		The index of the frame.
	 * @param	rectangle	A Rectangle instance to copy the values into. By default a new instance is created.
	 * @return	A Rectangle instance. Returns null if the frame does not exist, or the image is not fully loaded.
	 */
	public function getFrameBounds(index:Int, rectangle:Rectangle = null):Rectangle;
	
	/**
	 * Returns the total number of frames in the specified animation, or in the whole sprite sheet if the animation param is omitted.
	 * Returns 0 if the spritesheet relies on calculated frame counts, and the images have not been fully loaded.
	 * @param	animation	The name of the animation to get a frame count for.
	 * @return	The number of frames in the animation, or in the entire sprite sheet if the animation param is omitted.
	 */
	public function getNumFrames(animation:AnimationName = null):Int;
	
	
	
	////////////////////
	//   DEPRECATED   //
	////////////////////
	
	/**
	 * Use the animations property instead.
	 */
	@:deprecated
	@:noCompletion
	public function getAnimations():Array<AnimationName>;
	
	
	
	//////////////////
	//   OVERRIDE   //
	//////////////////
	
	/**
	 * Returns a string representation of this SpriteSheet.
	 * @return A string representation of the instance.
	 */
	override public function toString():String;
}