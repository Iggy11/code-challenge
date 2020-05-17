<?php

namespace App\Listeners;

use Illuminate\Auth\Events\Failed;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

use Illuminate\Http\Request;
use App\LoginActivity;

class RecordFailedLoginActivity
{


    protected $request;

    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct(Request $request)
    {
        $this->request = $request;
    }

    /**
     * Handle the event.
     *
     * @param  Failed  $event
     * @return void
     */
    public function handle(Failed $event)
    {

       LoginActivity::create([
            'customer_id' => is_null($event->user) ? null : $event->user->id,
            'email_address' => $event->credentials['email'],
            'ip_address' => $this->request->ip(),
            'is_success' => false,

        ]);

    }
}
