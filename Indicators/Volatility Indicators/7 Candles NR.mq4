//|------------------------------------------------------------------|
//|                                               Indicator Arrow.mq4|
//|                                    Copyright © 2013, Mr.SilverKZ |
//|                                                 SilverKZ@mail.kz |
//|                                                                  |
//|                                                                  |
//|                                                                  |
//|  свечи в коде идут  5-4-3-2-1-0                                  |
//|                                                                  |
//+------------------------------------------------------------------+



#property copyright "SilverKZ"
#property link "SilverKZ@mail.kz"

#property description "Находит 7 свечу с мин/макс диапазоном"
#property description "*поручик*               26.03.17"

#property indicator_chart_window

#property indicator_buffers 4
#property indicator_color1 clrRed
#property indicator_color2 clrBlue
#property indicator_color3 clrRed
#property indicator_color4 clrBlue

double buf_1[];
double buf_2[];
double buf_3[];
double buf_4[];

//+------------------------------------------------------------------+
//| Функция инициализации, запускается один раз                      |
//+------------------------------------------------------------------+
int init() 
  {
  SetIndexBuffer(0,buf_1);
   SetIndexBuffer(1,buf_2);
   SetIndexBuffer(2,buf_3);
   SetIndexBuffer(3,buf_4);
   

   SetIndexStyle (0,DRAW_ARROW, STYLE_SOLID, 1);
   SetIndexStyle (1,DRAW_ARROW, STYLE_SOLID, 1);
   SetIndexArrow (0,233);
   SetIndexArrow (1,234);
   
   SetIndexStyle (2,DRAW_ARROW, STYLE_SOLID, 1);
   SetIndexStyle (3,DRAW_ARROW, STYLE_SOLID, 1);
   SetIndexArrow (2,171);
   SetIndexArrow (3,171);
   
   
   SetIndexEmptyValue(0,0.0);
   SetIndexEmptyValue(1,0.0);
   SetIndexEmptyValue(2,0.0);
   SetIndexEmptyValue(3,0.0);
   
   
   
   
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
      bool DOWN  =  (High[i+6] - Low[i+6])< (High[i+0] - Low[i+0]) && 
                    (High[i+5] - Low[i+5])< (High[i+0] - Low[i+0]) && 
                    (High[i+4] - Low[i+4])< (High[i+0] - Low[i+0]) && 
                    (High[i+3] - Low[i+3])< (High[i+0] - Low[i+0]) && 
                    (High[i+2] - Low[i+2])< (High[i+0] - Low[i+0]) && 
                    (High[i+1] - Low[i+1])< (High[i+0] - Low[i+0])  ;
                                                     
                    
                   
       bool UP =    (High[i+6] - Low[i+6])> (High[i+0] - Low[i+0]) && 
                    (High[i+5] - Low[i+5])> (High[i+0] - Low[i+0]) && 
                    (High[i+4] - Low[i+4])> (High[i+0] - Low[i+0]) && 
                    (High[i+3] - Low[i+3])> (High[i+0] - Low[i+0]) && 
                    (High[i+2] - Low[i+2])> (High[i+0] - Low[i+0]) && 
                    (High[i+1] - Low[i+1])> (High[i+0] - Low[i+0])  ;
       
       
       
       ;
      
       
      if (UP)       buf_1[i+0] = Low[i+0]-3*Point;
      if (UP)       buf_3[i+6] = Low[i+6]-5*Point ; 
           
      if (DOWN)     buf_2[i+0] = High[i+0]+3*Point;
      if (DOWN)     buf_4[i+6] = High[i+6]+5*Point ; 
    
      
     }
   return(0);
 }
  //  ---- end

