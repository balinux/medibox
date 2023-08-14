<?php

namespace App\Filament\Resources\PillHistoryResource\Pages;

use App\Filament\Resources\PillHistoryResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManagePillHistories extends ManageRecords
{
    protected static string $resource = PillHistoryResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
