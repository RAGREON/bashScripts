from PIL import Image
import cv2
from datetime import datetime

image_path = f"{datetime.now().strftime("%Y-%m-%d_%H-%M-%S")}.jpg"

cap = cv2.VideoCapture(0)

ret, frame = cap.read()

cv2.imwrite(f'{image_path}', frame)

Image.open(image_path).show()

cv2.destroyAllWindows()
