package;

import createjs.*;
import createjs.display.*;
import createjs.events.*;
import createjs.filters.*;
import createjs.geom.*;
import createjs.graphics.*;
import createjs.plugin.*;
import createjs.sheet.*;
import createjs.tween.*;
import createjs.ui.*;
import createjs.utils.*;

/**
 * ...
 * @author VolkovRA
 */
class Main 
{
	
	static function main() 
	{
		trace(EaselJS);
		trace(Stage);
		trace(Ticker);
		trace(TimingMode.TIMEOUT);
		trace(UID);
		trace(Utility);
		
		// display
		trace(Bitmap);
		trace(BitmapCache);
		trace(BitmapConfig);
		trace(BitmapText);
		trace(CacheConfig);
		trace(CanvasImageSource);
		trace(ChildType);
		trace(CompositeOperation);
		trace(Container);
		trace(DisplayObject);
		trace(DisplayProps);
		trace(DOMElement);
		trace(MovieClip);
		trace(MovieClipConfig);
		trace(MovieClipMode);
		trace(Shadow);
		trace(Shape);
		trace(Sprite);
		trace(Stage);
		trace(StageGL);
		
		// events
		trace(Event);
		trace(EventDispatcher);
		trace(EventObject);
		trace(EventPhase);
		trace(Listener);
		trace(ListenerCallback);
		trace(ListenerObject);
		trace(MouseEvent);
		
		// filters
		trace(AlphaMapFilter);
		trace(AlphaMaskFilter);
		trace(BlurFilter);
		trace(ColorFilter);
		trace(ColorMatrix);
		trace(ColorMatrixFilter);
		trace(Filter);
		
		// geom
		trace(Matrix2D);
		trace(Point);
		trace(Rectangle);
		
		// graphics
		trace(Arc);
		trace(ArcTo);
		trace(BeginPath);
		trace(BezierCurveTo);
		trace(Circle);
		trace(ClosePath);
		trace(Ellipse);
		trace(Fill);
		trace(FillStyle);
		trace(Graphics);
		trace(ICommand);
		trace(LineCapType);
		trace(LineJoinType);
		trace(LineTo);
		trace(MoveTo);
		trace(PolyStar);
		trace(QuadraticCurveTo);
		trace(Rect);
		trace(RepeatType);
		trace(RoundRect);
		trace(Stroke);
		trace(StrokeDash);
		trace(StrokeStyle);
		
		// plugin
		trace(MovieClipPlugin);
		
		// sheet
		trace(Animation);
		trace(AnimationName);
		trace(Frame);
		trace(FrameIndex);
		trace(SpriteSheet);
		trace(SpriteSheetBuilder);
		trace(SpriteSheetFormat);
		trace(SpriteSheetUtils);
		
		// tween
		trace(AbstractTweenConfig);
		trace(TimelineConfig);
		trace(TweenConfig);
		
		// ui
		trace(MouseCursor);
		
		// utils
		trace(WebGLInspector);
	}
}