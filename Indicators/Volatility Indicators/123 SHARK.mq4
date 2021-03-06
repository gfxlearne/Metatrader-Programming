//|------------------------------------------------------------------|
//|                                               Indicator Arrow.mq4|
//|                                    Copyright © 2013, Mr.SilverKZ |
//|                                                 SilverKZ@mail.kz |
//|                                                                  |
//| 21.07.15 ДОРАБОТАН ПОД SHARK 321                                 |
//|                                                                  |
//|                                                                  |
//|  свечи в коде идут  3-2-1-0                                       |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "SilverKZ"
#property link "SilverKZ@mail.kz"

#property description "   "
#property description " .........................  "
#property description "Ищет паттерн акула 32 (2 внутренних бара)"
#property description " 27.06.16 поручик"

#property indicator_chart_window
#property indicator_buffers 2
#property indicator_color1 clrRed
#property indicator_color2 clrBlue


double buf_1[];
double buf_2[];
//+------------------------------------------------------------------+
//| Функция инициализации, запускается один раз                      |
//+------------------------------------------------------------------+
int init() 
  {
   SetIndexBuffer(0,buf_1);
   SetIndexBuffer(1,buf_2);

   SetIndexStyle (0,DRAW_ARROW, STYLE_SOLID, 2);
   SetIndexStyle (1,DRAW_ARROW, STYLE_SOLID, 2);
   SetIndexArrow (0,82);
   SetIndexArrow (1,82);

   SetIndexEmptyValue(0,0.0);
   SetIndexEmptyValue(1,0.0);
   
   return(0);
  }
//+------------------------------------------------------------------+
//| Основная Функция, запускается на каждом тике                     |
//+------------------------------------------------------------------+
int start() 
  {
   if (Bars <= 100) return(0);
   int ExtCountedBars = IndicatorCounted();
   if (ExtCountedBars < 0) return(-1);
   if (ExtCountedBars > 0) ExtCountedBars--;
   for (int i=Bars-ExtCountedBars-1; i>=0; i--)
     { 
      bool DOWN  =  High[i+2] >= High[i+1] && High[i+1]>=  High[i+0] &&  
                    Low[i+2]  <= Low[i+1] &&  Low[i+1]  <= Low[i+0];
      
                       
                   
     bool UP =  High[i+2] >= High[i+1] && High[i+1] >= High[i+0] &&  
                Low[i+2]  <= Low[i+1] &&  Low[i+1]  <= Low[i+0];
      
      
       
      if (UP)       buf_1[i+0] = Low[i+0]-3*Point;
      if (DOWN)     buf_2[i+0] = High[i+0]+3*Point;
     }
   return(0);
 }
  //  ---- end

