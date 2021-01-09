import logging


def log():
    logger = logging.getLogger('Qvote_org_bot')
    logger.setLevel(logging.INFO)
    fh = logging.FileHandler(f'Qvote.log')
    formatter = logging.Formatter('%(lineno)d:%(asctime)s - %(name)s - %(levelname)s - %(message)s')
    fh.setFormatter(formatter)
    logger.addHandler(fh)
    return logger


logger = log()
