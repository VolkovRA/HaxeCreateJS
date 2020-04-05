package easeljs.display;

import haxe.extern.EitherType;

/**
 * Contain specify additional parameters for the cache logic.
 * Here are the detailed specifics of how to use the options object.
 * 
 *   1. If options.useGL is set to "new" a StageGL is created and contained on this for use when rendering the cache.
 *   2. If options.useGL is set to "stage" if the current stage is a StageGL it will be used. If not then it will default to "new".
 *   3. If options.useGL is a StageGL instance it will not create one but use the one provided.
 *   4. If options.useGL is undefined a Context 2D cache will be performed.
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
 * 
 * Documentation: https://www.createjs.com/docs/easeljs/classes/BitmapCache.html
 * @author VolkovRA
 */
typedef CacheConfig =
{
	/**
	 * Select whether to use context 2D, or WebGL rendering, and whether to make a new stage instance or use an existing one.
	 * [useGL=undefined] Undefined | "new" | "stage" | StageGL
	 */
	@:optional var useGL:EitherType<StageType, StageGL>;
}

/**
 * The options for select StageGL target.
 */
@:enum abstract StageType(String) to String
{
	/**
	 * Use a new Stage instance.
	 * A StageGL is created and contained on this for use when rendering the cache.
	 */
	var NEW = "new";
	
	/**
	 * Current StageGL.
	 * If the current stage is a StageGL it will be used, if not then it will default to "new".
	 */
	var STAGE = "stage";
}