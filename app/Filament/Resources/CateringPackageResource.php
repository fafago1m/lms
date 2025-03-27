<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BonusesRelationManagerResource\RelationManagers\BonusesRelationManager as RelationManagersBonusesRelationManager;
use App\Filament\Resources\CateringPackageResource\Pages;
use App\Filament\Resources\CateringPackageResource\RelationManagers;
use App\Filament\Resources\CateringPackageResource\RelationManagers\BonusesRelationManager;
use App\Filament\Resources\CateringPackageResource\RelationManagers\TiersRelationManager;
use App\Models\CateringPackage;
use BladeUI\Icons\Components\Icon;
use Filament\Forms;
use Filament\Forms\Components\Fieldset;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Repeater;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Infolists\Components\IconEntry;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CateringPackageResource extends Resource
{
    protected static ?string $model = CateringPackage::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([

                Fieldset::make('Additional')
                ->schema([

                    FileUpload::make('thumbnail')
                    ->directory('gambar')
                    ->image()
                    ->required(),

                    TextInput::make('name')
                ->maxLength(255)
                ->required(),

                TextInput::make('slug')
                ->label('Slug')
                ->disabled()
                ->maxLength(255),

                Repeater::make('photos')
                ->relationship('photos')
                ->schema([
                    FileUpload::make('photo')
                    ->directory('gambar')
                    ->required(),
                ]),
                ]),

                Fieldset::make('Additional')
                ->schema([
                    Textarea::make('about')
                    ->required(),

                    Select::make('is_popular')
                    ->options([
                        1 => 'Populer',
                        0 => 'Not Populer'
                    ])
                    ->required(),

                    Select::make('city_id')
                    ->relationship('city', 'name')
                    ->searchable()
                    ->preload()
                    ->required(),

                    Select::make('kitchen_id')
                    ->relationship('kitchen', 'name')
                    ->searchable()
                    ->preload()
                    ->required(),

                    Select::make('category_id')
                    ->relationship('category', 'name')
                    ->searchable()
                    ->required()

                ]),
                
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('thumbnail'),
                TextColumn::make('name')
                ->searchable(),
                IconColumn::make('is_popular')
                ->boolean()
                ->trueColor('success')
                ->falseColor('danger')
                ->trueIcon('heroicon-o-check-circle')
                ->falseIcon('heroicon-o-x-circle')
                ->label('Populer'),
            ])
            ->filters([
                SelectFilter::make('city_id')
                ->label('City')
                ->relationship('city', 'name'),

                SelectFilter::make('kitchen_id')
                ->label('Kitchen')
                ->relationship('kitchen', 'name'),

                SelectFilter::make('category', 'name')
                ->label('Category')
                ->relationship('category', 'name')

            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                    Tables\Actions\ForceDeleteBulkAction::make(),
                    Tables\Actions\RestoreBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            BonusesRelationManager::class,
            TiersRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCateringPackages::route('/'),
            'create' => Pages\CreateCateringPackage::route('/create'),
            'edit' => Pages\EditCateringPackage::route('/{record}/edit'),
        ];
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
            ]);
    }
}
