#!/usr/bin/env python
# coding=utf-8
import pika

connection = pika.BlockingConnection(pika.URLParameters('amqp://test:test@localhost:5672/'))
channel = connection.channel()
channel.queue_declare(queue='hello')


def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)


channel.basic_consume('hello', callback, auto_ack=True)
channel.start_consuming()