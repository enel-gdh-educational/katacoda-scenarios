import schedule
import time
import logging

from src.model import TrainModel

handlers = [logging.StreamHandler()]
logging.basicConfig(handlers=handlers, format='%(levelname)s:%(message)s', level=logging.INFO)


if __name__ == '__main__':
    tm = TrainModel()
    schedule.every().second.do(tm.train_once)
    schedule.every().day.do(tm.train)
    while True:
        schedule.run_pending()
        time.sleep(1)
