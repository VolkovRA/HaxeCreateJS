package easeljs.display;

import haxe.extern.EitherType;
import js.html.CanvasElement;
import js.html.ImageElement;
import js.html.VideoElement;

/**
 * The source image to display.
 * This can be a image, video or canvas.
 * @author VolkovRA
 */
typedef CanvasImageSource = EitherType<ImageElement, EitherType<CanvasElement, VideoElement>>;