
#include <pthread.h>
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>

// Thread function for example_pthread_mutex
void* increment_basic(void* arg)
{
    static pthread_mutex_t* mutex = NULL;
    static int* counter = NULL;

    // Initialize static variables from arg (passed as struct to avoid global variables)
    struct mutex_data {
        pthread_mutex_t* mutex;
        int* counter;
    };
    struct mutex_data* data = (struct mutex_data*)arg;
    if (!mutex) mutex = data->mutex;
    if (!counter) counter = data->counter;

    for (int i = 0; i < 5; i++) {
        int ret = pthread_mutex_lock(mutex);
        if (ret != 0) {
            fprintf(stderr, "increment_basic: pthread_mutex_lock failed: %s\n", strerror(ret));
            return (void*)(intptr_t)ret;
        }
        (*counter)++;
        printf("Basic Mutex: Thread %ld incremented counter to %d\n", (long)(intptr_t)arg, *counter);
        ret = pthread_mutex_unlock(mutex);
        if (ret != 0) {
            fprintf(stderr, "increment_basic: pthread_mutex_unlock failed: %s\n", strerror(ret));
            return (void*)(intptr_t)ret;
        }
        usleep(100000); // Simulate delay
    }
    return NULL;
}

// Thread functions for example_pthread_condvar
void* producer(void* arg)
{
    struct condvar_data {
        pthread_mutex_t* mutex;
        pthread_cond_t* cond;
        int* buffer;
    };
    struct condvar_data* data = (struct condvar_data*)arg;

    for (int i = 1; i <= 3; i++) {
        int ret = pthread_mutex_lock(data->mutex);
        if (ret != 0) {
            fprintf(stderr, "producer: pthread_mutex_lock failed: %s\n", strerror(ret));
            return (void*)(intptr_t)ret;
        }
        *(data->buffer) = i;
        printf("Producer: Produced %d\n", *(data->buffer));
        ret = pthread_cond_signal(data->cond);
        if (ret != 0) {
            fprintf(stderr, "producer: pthread_cond_signal failed: %s\n", strerror(ret));
            pthread_mutex_unlock(data->mutex);
            return (void*)(intptr_t)ret;
        }
        ret = pthread_mutex_unlock(data->mutex);
        if (ret != 0) {
            fprintf(stderr, "producer: pthread_mutex_unlock failed: %s\n", strerror(ret));
            return (void*)(intptr_t)ret;
        }
        usleep(200000);
    }
    return NULL;
}

void* consumer(void* arg)
{
    struct condvar_data {
        pthread_mutex_t* mutex;
        pthread_cond_t* cond;
        int* buffer;
    };
    struct condvar_data* data = (struct condvar_data*)arg;

    int ret = pthread_mutex_lock(data->mutex);
    if (ret != 0) {
        fprintf(stderr, "consumer: pthread_mutex_lock failed: %s\n", strerror(ret));
        return (void*)(intptr_t)ret;
    }
    while (*(data->buffer) == 0) {
        printf("Consumer: Waiting for data\n");
        ret = pthread_cond_wait(data->cond, data->mutex);
        if (ret != 0) {
            fprintf(stderr, "consumer: pthread_cond_wait failed: %s\n", strerror(ret));
            pthread_mutex_unlock(data->mutex);
            return (void*)(intptr_t)ret;
        }
    }
    printf("Consumer: Consumed %d\n", *(data->buffer));
    *(data->buffer) = 0;
    ret = pthread_mutex_unlock(data->mutex);
    if (ret != 0) {
        fprintf(stderr, "consumer: pthread_mutex_unlock failed: %s\n", strerror(ret));
        return (void*)(intptr_t)ret;
    }
    return NULL;
}

// Thread function for example_pthread_barrier
void* worker(void* arg) 
{
    pthread_barrier_t* barrier = (pthread_barrier_t*)arg;
    printf("Worker %ld: Before barrier\n", (long)(intptr_t)arg);
    int ret = pthread_barrier_wait(barrier);
    if (ret == PTHREAD_BARRIER_SERIAL_THREAD) {
        printf("Worker %ld: Last to arrive, serial thread\n", (long)(intptr_t)arg);
    } else if (ret == 0) {
        printf("Worker %ld: Passed barrier\n", (long)(intptr_t)arg);
    } else {
        fprintf(stderr, "Worker %ld: pthread_barrier_wait failed: %s\n", (long)(intptr_t)arg, strerror(ret));
        return (void*)(intptr_t)ret;
    }
    return NULL;
}

void example_pthread_mutex() {
    printf("=== Starting %s ===\n", __func__);

    // Basic Mutex: Protect shared counter
    pthread_mutex_t basic_mutex = PTHREAD_MUTEX_INITIALIZER;
    int shared_counter = 0;
    struct mutex_data {
        pthread_mutex_t* mutex;
        int* counter;
    } data = {&basic_mutex, &shared_counter};

    pthread_t threads_basic[2];
    for (long i = 0; i < 2; i++) {
        int ret = pthread_create(&threads_basic[i], NULL, increment_basic, &data);
        if (ret != 0) {
            fprintf(stderr, "pthread_create failed: %s\n", strerror(ret));
            return;
        }
    }
    for (int i = 0; i < 2; i++) {
        void* retval;
        int ret = pthread_join(threads_basic[i], &retval);
        if (ret != 0) {
            fprintf(stderr, "pthread_join failed: %s\n", strerror(ret));
        } else if (retval != NULL) {
            fprintf(stderr, "Thread %d returned error: %ld\n", i, (long)(intptr_t)retval);
        }
    }
    printf("Basic Mutex: Final counter = %d (expected 10)\n", shared_counter);

    // Mutex attribute: Errorcheck type
    pthread_mutexattr_t attr_errorcheck;
    int ret = pthread_mutexattr_init(&attr_errorcheck);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutexattr_init failed: %s\n", strerror(ret));
        return;
    }
    ret = pthread_mutexattr_settype(&attr_errorcheck, PTHREAD_MUTEX_ERRORCHECK);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutexattr_settype failed: %s\n", strerror(ret));
        pthread_mutexattr_destroy(&attr_errorcheck);
        return;
    }
    pthread_mutex_t errorcheck_mutex;
    ret = pthread_mutex_init(&errorcheck_mutex, &attr_errorcheck);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_init failed: %s\n", strerror(ret));
        pthread_mutexattr_destroy(&attr_errorcheck);
        return;
    }

    // Try unlock by non-owner (should error)
    ret = pthread_mutex_unlock(&errorcheck_mutex);
    if (ret == EPERM) {
        printf("Errorcheck Mutex: Correctly detected non-owner unlock (EPERM)\n");
    } else if (ret != 0) {
        fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
    }

    ret = pthread_mutex_lock(&errorcheck_mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    } else {
        printf("Errorcheck Mutex: Locked successfully\n");
        ret = pthread_mutex_unlock(&errorcheck_mutex);
        if (ret != 0) {
            fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
        }
    }
    ret = pthread_mutex_destroy(&errorcheck_mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_destroy failed: %s\n", strerror(ret));
    }
    ret = pthread_mutexattr_destroy(&attr_errorcheck);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutexattr_destroy failed: %s\n", strerror(ret));
    }

    // Recursive Mutex
    pthread_mutexattr_t attr_recursive;
    ret = pthread_mutexattr_init(&attr_recursive);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutexattr_init failed: %s\n", strerror(ret));
        return;
    }
    ret = pthread_mutexattr_settype(&attr_recursive, PTHREAD_MUTEX_RECURSIVE);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutexattr_settype failed: %s\n", strerror(ret));
        pthread_mutexattr_destroy(&attr_recursive);
        return;
    }
    pthread_mutex_t recursive_mutex;
    ret = pthread_mutex_init(&recursive_mutex, &attr_recursive);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_init failed: %s\n", strerror(ret));
        pthread_mutexattr_destroy(&attr_recursive);
        return;
    }

    ret = pthread_mutex_lock(&recursive_mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    }
    ret = pthread_mutex_lock(&recursive_mutex); // Recursive, no deadlock
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    } else {
        printf("Recursive Mutex: Locked twice by same thread\n");
        pthread_mutex_unlock(&recursive_mutex);
        pthread_mutex_unlock(&recursive_mutex);
    }
    ret = pthread_mutex_destroy(&recursive_mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_destroy failed: %s\n", strerror(ret));
    }
    ret = pthread_mutexattr_destroy(&attr_recursive);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutexattr_destroy failed: %s\n", strerror(ret));
    }

    // Timedlock
    pthread_mutex_t timed_mutex = PTHREAD_MUTEX_INITIALIZER;
    ret = pthread_mutex_lock(&timed_mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
    }
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += 1;
    ret = pthread_mutex_timedlock(&timed_mutex, &ts);
    if (ret == ETIMEDOUT) {
        printf("Timed Mutex: Correctly timed out\n");
    } else if (ret != 0) {
        fprintf(stderr, "pthread_mutex_timedlock failed: %s\n", strerror(ret));
    }
    ret = pthread_mutex_unlock(&timed_mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
    }

    // Trylock
    ret = pthread_mutex_trylock(&timed_mutex);
    if (ret == 0) {
        printf("Trylock Mutex: Successfully locked\n");
        pthread_mutex_unlock(&timed_mutex);
    } else if (ret == EBUSY) {
        printf("Trylock Mutex: Busy as expected\n");
    } else {
        fprintf(stderr, "pthread_mutex_trylock failed: %s\n", strerror(ret));
    }

    ret = pthread_mutex_destroy(&timed_mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_destroy failed: %s\n", strerror(ret));
    }

    printf("=== Ending %s ===\n\n", __func__);
}

void example_pthread_condvar() {
    printf("=== Starting %s ===\n", __func__);

    // Condition variable: Producer-consumer
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
    int buffer = 0;
    struct condvar_data {
        pthread_mutex_t* mutex;
        pthread_cond_t* cond;
        int* buffer;
    } data = {&mutex, &cond, &buffer};

    pthread_t prod, cons;
    int ret = pthread_create(&prod, NULL, producer, &data);
    if (ret != 0) {
        fprintf(stderr, "pthread_create (producer) failed: %s\n", strerror(ret));
        return;
    }
    ret = pthread_create(&cons, NULL, consumer, &data);
    if (ret != 0) {
        fprintf(stderr, "pthread_create (consumer) failed: %s\n", strerror(ret));
        return;
    }
    void* retval;
    ret = pthread_join(prod, &retval);
    if (ret != 0) {
        fprintf(stderr, "pthread_join (producer) failed: %s\n", strerror(ret));
    } else if (retval != NULL) {
        fprintf(stderr, "Producer returned error: %ld\n", (long)(intptr_t)retval);
    }
    ret = pthread_join(cons, &retval);
    if (ret != 0) {
        fprintf(stderr, "pthread_join (consumer) failed: %s\n", strerror(ret));
    } else if (retval != NULL) {
        fprintf(stderr, "Consumer returned error: %ld\n", (long)(intptr_t)retval);
    }

    // Broadcast: Wake all
    pthread_t consumers[2];
    buffer = 0;
    for (int i = 0; i < 2; i++) {
        ret = pthread_create(&consumers[i], NULL, consumer, &data);
        if (ret != 0) {
            fprintf(stderr, "pthread_create (consumer %d) failed: %s\n", i, strerror(ret));
            return;
        }
    }
    usleep(500000); // Let consumers wait
    ret = pthread_mutex_lock(&mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
        return;
    }
    buffer = 99;
    printf("Broadcast: Setting buffer to 99 and broadcasting\n");
    ret = pthread_cond_broadcast(&cond);
    if (ret != 0) {
        fprintf(stderr, "pthread_cond_broadcast failed: %s\n", strerror(ret));
        pthread_mutex_unlock(&mutex);
        return;
    }
    ret = pthread_mutex_unlock(&mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
        return;
    }
    for (int i = 0; i < 2; i++) {
        ret = pthread_join(consumers[i], &retval);
        if (ret != 0) {
            fprintf(stderr, "pthread_join (consumer %d) failed: %s\n", i, strerror(ret));
        } else if (retval != NULL) {
            fprintf(stderr, "Consumer %d returned error: %ld\n", i, (long)(intptr_t)retval);
        }
    }

    // Timedwait
    ret = pthread_mutex_lock(&mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_lock failed: %s\n", strerror(ret));
        return;
    }
    struct timespec ts;
    clock_gettime(CLOCK_REALTIME, &ts);
    ts.tv_sec += 1;
    ret = pthread_cond_timedwait(&cond, &mutex, &ts);
    if (ret == ETIMEDOUT) {
        printf("Cond Timedwait: Timed out as expected\n");
    } else if (ret != 0) {
        fprintf(stderr, "pthread_cond_timedwait failed: %s\n", strerror(ret));
    }
    ret = pthread_mutex_unlock(&mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_unlock failed: %s\n", strerror(ret));
    }

    // Attribute: Set clock
    pthread_condattr_t condattr;
    ret = pthread_condattr_init(&condattr);
    if (ret != 0) {
        fprintf(stderr, "pthread_condattr_init failed: %s\n", strerror(ret));
        return;
    }
    ret = pthread_condattr_setclock(&condattr, CLOCK_MONOTONIC);
    if (ret != 0) {
        fprintf(stderr, "pthread_condattr_setclock failed: %s\n", strerror(ret));
        pthread_condattr_destroy(&condattr);
        return;
    }
    pthread_cond_t cond_mono;
    ret = pthread_cond_init(&cond_mono, &condattr);
    if (ret != 0) {
        fprintf(stderr, "pthread_cond_init failed: %s\n", strerror(ret));
        pthread_condattr_destroy(&condattr);
        return;
    }
    printf("Cond Attr: Set to monotonic clock\n");
    ret = pthread_cond_destroy(&cond_mono);
    if (ret != 0) {
        fprintf(stderr, "pthread_cond_destroy failed: %s\n", strerror(ret));
    }
    ret = pthread_condattr_destroy(&condattr);
    if (ret != 0) {
        fprintf(stderr, "pthread_condattr_destroy failed: %s\n", strerror(ret));
    }

    ret = pthread_cond_destroy(&cond);
    if (ret != 0) {
        fprintf(stderr, "pthread_cond_destroy failed: %s\n", strerror(ret));
    }
    ret = pthread_mutex_destroy(&mutex);
    if (ret != 0) {
        fprintf(stderr, "pthread_mutex_destroy failed: %s\n", strerror(ret));
    }

    printf("=== Ending %s ===\n\n", __func__);
}

void example_pthread_barrier()
{
    printf("=== Starting %s ===\n", __func__);

    // Basic barrier: 3 threads wait
    pthread_barrier_t barrier;
    int ret = pthread_barrier_init(&barrier, NULL, 3);
    if (ret != 0) {
        fprintf(stderr, "pthread_barrier_init failed: %s\n", strerror(ret));
        return;
    }

    pthread_t workers[3];
    for (long i = 0; i < 3; i++) {
        ret = pthread_create(&workers[i], NULL, worker, &barrier);
        if (ret != 0) {
            fprintf(stderr, "pthread_create (worker %ld) failed: %s\n", i, strerror(ret));
            pthread_barrier_destroy(&barrier);
            return;
        }
        usleep(100000 * (i + 1)); // Different delays
    }
    for (int i = 0; i < 3; i++) {
        void* retval;
        ret = pthread_join(workers[i], &retval);
        if (ret != 0) {
            fprintf(stderr, "pthread_join (worker %d) failed: %s\n", i, strerror(ret));
        } else if (retval != NULL) {
            fprintf(stderr, "Worker %d returned error: %ld\n", i, (long)(intptr_t)retval);
        }
    }
    ret = pthread_barrier_destroy(&barrier);
    if (ret != 0) {
        fprintf(stderr, "pthread_barrier_destroy failed: %s\n", strerror(ret));
        return;
    }

    // Attribute: Process shared barrier
    pthread_barrierattr_t barrierattr;
    ret = pthread_barrierattr_init(&barrierattr);
    if (ret != 0) {
        fprintf(stderr, "pthread_barrierattr_init failed: %s\n", strerror(ret));
        return;
    }
    ret = pthread_barrierattr_setpshared(&barrierattr, PTHREAD_PROCESS_SHARED);
    if (ret != 0) {
        fprintf(stderr, "pthread_barrierattr_setpshared failed: %s\n", strerror(ret));
        pthread_barrierattr_destroy(&barrierattr);
        return;
    }
    pthread_barrier_t shared_barrier;
    ret = pthread_barrier_init(&shared_barrier, &barrierattr, 2);
    if (ret != 0) {
        fprintf(stderr, "pthread_barrier_init failed: %s\n", strerror(ret));
        pthread_barrierattr_destroy(&barrierattr);
        return;
    }
    printf("Barrier Attr: Set to process shared\n");
    ret = pthread_barrier_destroy(&shared_barrier);
    if (ret != 0) {
        fprintf(stderr, "pthread_barrier_destroy failed: %s\n", strerror(ret));
    }
    ret = pthread_barrierattr_destroy(&barrierattr);
    if (ret != 0) {
        fprintf(stderr, "pthread_barrierattr_destroy failed: %s\n", strerror(ret));
    }

    printf("=== Ending %s ===\n\n", __func__);
}

int main()
{
    example_pthread_mutex();
    example_pthread_condvar();
    example_pthread_barrier();
    return 0;
}