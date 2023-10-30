import gymnasium as gym

import tensorflow as tf
from keras.models import Sequential
from keras.layers import Dense

import numpy as np
import random
from collections import deque

class QLAgent():
    def __init__(self, env):
        self.env = env

        self.state_size = env.observation_space.n
        self.action_size = env.action_space.n

        self.learning_rate = 0.9
        self.discount_rate = 0.8
        self.epsilon = 1.0
        self.decay_rate = 0.005

        self.model = self.build_model()

    def build_model(self):
        return np.zeros((self.state_size, self.action_size)) #qtable

    def action(self, state):
        if np.random.uniform(0, 1) < self.epsilon:
            return self.env.action_space.sample()
        else:
            return np.argmax(self.model[state,:])

    def greedy(self):
        self.epsilon = np.exp(-self.decay_rate * episode)

    def update_model(self, current_state, next_state, reward, action):
        self.model[current_state, action] = self.model[current_state, action] + self.learning_rate * (reward + self.discount_rate * np.max(self.model[next_state,:]) - self.model[current_state, action])

if __name__ == "__main__":
    env = gym.make('Taxi-v3')
    agent = QLAgent(env)

    episodes = 1000
    steps = 99
    for episode in range(episodes):
        state, _ = env.reset()
        
        for s in range(steps):
            action = agent.action(state)
            next_state, reward, done, _, _ = env.step(action)

            agent.update_model(current_state=state, next_state=next_state, reward=reward, action=action)

            state = next_state

            agent.greedy()

            if done == True:
                break


    # Using the trained agent
    env = gym.make('Taxi-v3', render_mode="ansi")

    state, _ = env.reset()
    done = False
    while not done:
        action = np.argmax(agent.model[state,:])

        state, reward, done, _, _ = env.step(action)

        print(env.render())