//*****************************************************************
  //                       Delphi-OpenCV Demo
  //               Copyright (C) 2013 Project Delphi-OpenCV
  // ****************************************************************
  // Contributor:
    // Laentir Valetov
  // email:laex@bk.ru
  // ****************************************************************
  // You may retrieve the latest version of this file at the GitHub,
  // located at git://github.com/Laex/Delphi-OpenCV.git
  // ****************************************************************
  // The contents of this file are used with permission, subject to
  // the Mozilla Public License Version 1.1 (the "License"); you may
  // not use this file except in compliance with the License. You may
  // obtain a copy of the License at
  // http://www.mozilla.org/MPL/MPL-1_1Final.html
  //
  // Software distributed under the License is distributed on an
  // "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
  // implied. See the License for the specific language governing
  // rights and limitations under the License.
  //*******************************************************************

program cv_Smooth;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  ocv.highgui_c,
  ocv.core_c,
  ocv.core.types_c,
  ocv.imgproc_c,
  ocv.imgproc.types_c,
  uResourcePaths;

const
  // ??? ????????
  filename = cResourceMedia + 'cat2.jpg';

var
  image: PIplImage = nil;
  dst: PIplImage = nil;

begin
  try
    // ???????? ????????
    image := cvLoadImage(filename, 1);
    // ????????? ????????
    dst := cvCloneImage(image);
    Writeln('[i] image: ', filename);
    if not Assigned(image) then
      Halt;
    // ???? ??? ??????????? ????????
    cvNamedWindow('original', CV_WINDOW_AUTOSIZE);
    cvNamedWindow('Smooth', CV_WINDOW_AUTOSIZE);
    // c????????? ?c?????? ????????
    cvSmooth(image, dst, CV_GAUSSIAN, 3, 3);
    // cvSmooth(image, dst, CV_BLUR_NO_SCALE, 3, 3);
    // ?????????? ????????
    cvShowImage('original', image);
    cvShowImage('Smooth', dst);
    // ???? ??????? ???????
    cvWaitKey(0);
    // ?c????????? ??c??c?
    cvReleaseImage(image);
    cvReleaseImage(dst);
    // ??????? ????
    cvDestroyWindow('original');
    cvDestroyWindow('Smooth');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
