package createjs.loader;

/**
 * Defines the load types that PreloadJS supports by default.
 * This is typically used when passing a type override to a LoadQueue.
 * 
 * Documentation: https://www.createjs.com/docs/preloadjs/classes/Types.html
 * @author VolkovRA
 */
@:enum abstract LoadType(String) to String
{
	/**
	 * The preload type for generic binary types.
	 * Note that images are loaded as binary files when using XHR.
	 */
	var BINARY = "binary";
	
	/**
	 * The preload type for css files.
	 * CSS files are loaded using a <link> when loaded with XHR, or a <style> tag when loaded with tags.
	 */
	var CSS = "css";
	
	/**
	 * The preload type for font files.
	 */
	var FONT = "font";
	
	/**
	 * The preload type for fonts specified with CSS (such as Google fonts)
	 */
	var FONTCSS = "fontcss";
	
	/**
	 * The preload type for image files, usually png, gif, or jpg/jpeg.
	 * Images are loaded into an <image> tag.
	 */
	var IMAGE = "image";
	
	/**
	 * The preload type for javascript files, usually with the "js" file extension. JavaScript files are loaded into a <script> tag.
	 * Since version 0.4.1+, due to how tag-loaded scripts work, all JavaScript files are automatically injected into the body
	 * of the document to maintain parity between XHR and tag-loaded scripts. In version 0.4.0 and earlier, only tag-loaded scripts are injected.
	 */
	var JAVASCRIPT = "javascript";
	
	/**
	 * The preload type for json files, usually with the "json" file extension.
	 * JSON data is loaded and parsed into a JavaScript object.
	 * Note that if a callback is present on the load item, the file will be loaded with JSONP,
	 * no matter what the LoadQueue/preferXHR:property property is set to, and the JSON must contain a matching wrapper function.
	 */
	var JSON = "json";
	
	/**
	 * The preload type for jsonp files, usually with the "json" file extension.
	 * JSON data is loaded and parsed into a JavaScript object.
	 * You are required to pass a callback parameter that matches the function wrapper in the JSON.
	 * Note that JSONP will always be used if there is a callback present, no matter what the LoadQueue/preferXHR:property property is set to.
	 */
	var JSONP = "jsonp";
	
	/**
	 * The preload type for json-based manifest files, usually with the "json" file extension.
	 * The JSON data is loaded and parsed into a JavaScript object. PreloadJS will then look for a "manifest" property in the JSON,
	 * which is an Array of files to load, following the same format as the loadManifest method. If a "callback" is specified on the
	 * manifest object, then it will be loaded using JSONP instead, regardless of what the LoadQueue/preferXHR:property property is set to.
	 */
	var MANIFEST = "manifest";
	
	/**
	 * The preload type for sound files, usually mp3, ogg, or wav.
	 * When loading via tags, audio is loaded into an <audio> tag.
	 */
	var SOUND = "sound";
	
	/**
	 * The preload type for SpriteSheet files.
	 * SpriteSheet files are JSON files that contain string image paths.
	 */
	var SPRITESHEET = "spritesheet";
	
	/**
	 * The preload type for SVG files.
	 */
	var SVG = "svg";
	
	/**
	 * The preload type for text files, which is also the default file type if the type can not be determined.
	 * Text is loaded as raw text.
	 */
	var TEXT = "text";
	
	/**
	 * The preload type for video files, usually mp4, ts, or ogg.
	 * When loading via tags, video is loaded into an <video> tag.
	 */
	var VIDEO = "video";
	
	/**
	 * The preload type for xml files.
	 * XML is loaded into an XML document.
	 */
	var XML = "xml";
}